var verbose = true;
var s; //canvas
var availablePins_ = [];
var hostname = "http://localhost:8888";
var X_SCALE_ = 1;
var Y_SCALE_ = 1;
var scaleIsValid_ = true;
var cellWidth_ = ((window.innerWidth / 25) * X_SCALE_);
var cellHeight_ = ((window.innerHeight / 12.5) * Y_SCALE_);
var timelineDisplay_ = 0;
var ruler_ = new Ruler();
var hideButton;
var hidden_ = [];
var delete_ = false;
// Constructor for Shape objects to hold data for all drawn objects.
// For now they will just be defined as rectangles.
function Shape(x, y, w, h, fill) {
    console.log(w);
    this.x = x || 0;
    this.y = y || 0;
    this.w = w || 1;
    this.h = h || 1;

    var color = "rgba(" + [Math.floor(Math.random() * 255)] + ", " + [Math.floor(Math.random() * 255)] + ", " + [Math.floor(Math.random() * 255)] + ", 0.8)";
    console.log(color);
    this.fill = fill || color;
}

function Ruler(xStart, yStart, xEnd, yEnd){
    this.xStart = xStart || null;
    this.yStart = yStart || null;
    this.xEnd = xEnd || null;
    this.yEnd = yEnd || null;
    this.selection = null;
    this.released = null;
}
// Draws this shape to a given context
Shape.prototype.draw = function(ctx) {
  ctx.fillStyle = this.fill;
  ctx.fillRect(getCellX(this.x), getCellY(this.y), getCellWidth(this.w), getCellHeight(this.h));
}

// Determine if a point is inside the shape's bounds
Shape.prototype.contains = function(mx, my) {
  // All we have to do is make sure the Mouse X,Y fall in the area between
  // the shape's X and (X + Width) and its Y and (Y + Height)
    return  (getCellX(this.x) <= mx) && (getCellX(this.x) + getCellWidth(this.w) >= mx) &&
    (getCellY(this.y) <= my) && (getCellY(this.y) + getCellHeight(this.h) >= my);
}

function CanvasState(canvas) {
  // **** First some setup! ****
  this.canvas = canvas;
  this.width = canvas.width;
  this.height = canvas.height;
  this.ctx = canvas.getContext('2d');
  // This complicates things a little but but fixes mouse co-ordinate problems
  // when there's a border or padding. See getMouse for more detail
  var stylePaddingLeft, stylePaddingTop, styleBorderLeft, styleBorderTop;
  if (document.defaultView && document.defaultView.getComputedStyle) {
    this.stylePaddingLeft = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingLeft'], 10)      || 0;
    this.stylePaddingTop  = parseInt(document.defaultView.getComputedStyle(canvas, null)['paddingTop'], 10)       || 0;
    this.styleBorderLeft  = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderLeftWidth'], 10)  || 0;
    this.styleBorderTop   = parseInt(document.defaultView.getComputedStyle(canvas, null)['borderTopWidth'], 10)   || 0;
  }
  // Some pages have fixed-position bars (like the stumbleupon bar) at the top or left of the page
  // They will mess up mouse coordinates and this fixes that
  var html = document.body.parentNode;
  this.htmlTop = html.offsetTop;
  this.htmlLeft = html.offsetLeft;

  // **** Keep track of state! ****
  
  this.valid = false; // when set to false, the canvas will redraw everything
  this.shapes = [];  // the collection of things to be drawn
  this.dragging = false; // Keep track of when we are dragging
  this.rulerDragging = false;
  // the current selected object. In the future we could turn this into an array for multiple selection
  this.selection = null;
  this.dragoffx = 0; // See mousedown and mousemove events for explanation
  this.dragoffy = 0;
  
  // **** Then events! ****
  
  // This is an example of a closure!
  // Right here "this" means the CanvasState. But we are making events on the Canvas itself,
  // and when the events are fired on the canvas the variable "this" is going to mean the canvas!
  // Since we still want to use this particular CanvasState in the events we have to save a reference to it.
  // This is our reference!
  var myState = this;
  
  //fixes a problem where double clicking causes text to get selected on the canvas
  canvas.addEventListener('selectstart', function(e) { e.preventDefault(); return false; }, false);
  // Up, down, and move are for dragging
  canvas.addEventListener('mousedown', function(e) {
    var mouse = myState.getMouse(e);
    var mx = mouse.x;
    var my = mouse.y;
    var shapes = myState.shapes;
    var l = shapes.length;
    for (var i = l-1; i >= 0; i--) {
      if (shapes[i].contains(mx, my)) {
        var mySel = shapes[i];
        // Keep track of where in the object we clicked
        // so we can move it smoothly (see mousemove)
        myState.dragoffx = mx - getCellWidth(mySel.x);
	myState.dragging = true;
        myState.selection = mySel;
        myState.valid = false;
        return;
      }
    }
    //Check if the ruler was clicked
    if(((((0) <= mx) && (window.innerWidth >= mx) && ((0) <= my) && (getRibbonOffset() >= my))) && !myState.rulerDragging){
	myState.rulerDragging = true;
	myState.valid = false;
	ruler_.selection = true;
	ruler_.xStart = Math.floor((mx - (getSidebarOffset())) * (1 / getCellWidth(1)) );
	ruler_.yStart = my;
	ruler_.xEnd = Math.floor((mx - (getSidebarOffset())) * (1 / getCellWidth(1)) );
	ruler_.yEnd = my;
	return;
    }
    // havent returned means we have failed to select anything.
    // If there was an object selected, we deselect it
    if (myState.selection) {
      myState.selection = null;
      myState.valid = false; // Need to clear the old selection border
    }
  }, true);
  canvas.addEventListener('mousemove', function(e) {
    if (myState.dragging){
      var mouse = myState.getMouse(e);
      // We don't want to drag the object by its top-left corner, we want to drag it
      // from where we clicked. Thats why we saved the offset and use it here
      myState.selection.x = (mouse.x - myState.dragoffx)  * (1/ getCellWidth(1));
      myState.selection.y = (mouse.y - myState.dragoffy) * (1/ getCellHeight(1));   
      myState.valid = false; // Something's dragging so we must redraw
    }
    if(myState.rulerDragging){
	var mouse = myState.getMouse(e);
	ruler_.xEnd = Math.floor(((mouse.x - (getSidebarOffset())) * (1 / getCellWidth(1))));
	ruler_.yEnd = mouse.y;
	myState.valid = false; //The ruler is highlighted so we have to redraw
    }

  }, true); 
  canvas.addEventListener('mouseup', function(e) {
    myState.dragging = false;
    myState.rulerDragging = false;
    ruler_.selection = null;
  }, true);
  // double click for making new shapes
  canvas.addEventListener('dblclick', function(e) {
    var mouse = myState.getMouse(e);
    myState.addShape(new Shape(mouse.x - 10, mouse.y - 10, 1, 1, 'rgba(0,255,0,.6)'));
  }, true);
  
  // **** Options! ****
  
  this.selectionColor = '#CC0000';
  this.selectionWidth = 2;  
  this.interval = 30;
  setInterval(function() { myState.draw(); }, myState.interval);
}

CanvasState.prototype.addShape = function(shape) {
  this.shapes.push(shape);
  this.valid = false;
}

CanvasState.prototype.clear = function() {
  this.ctx.clearRect(0, 0, this.width, this.height);
}

// While draw is called as often as the INTERVAL variable demands,
// It only ever does something if the canvas gets invalidated by our code
CanvasState.prototype.draw = function() {

  // if our state is invalid, redraw and validate!
  if (!this.valid || !scaleIsValid_) {
    var ctx = this.ctx;
    ctx.canvas.width  = window.innerWidth;
    ctx.canvas.height = window.innerHeight;
    var shapes = this.shapes;
    this.clear();
    
    //Draw static image (i.e. background lines, scale, header, pins, clock)

    //columns
    var referencePos = (getSidebarOffset());
    do{
	ctx.strokeStyle = 'red';
	ctx.rect(referencePos, (ctx.canvas.height / 12.5), cellWidth_, ((ctx.canvas.height) - (ctx.canvas.height / 12.5)));
	ctx.stroke();
	referencePos = (referencePos + cellWidth_);
    }while(referencePos <= ctx.canvas.width);

    //rows
    referencePos = (getRibbonOffset());
    
    do{
	ctx.rect((getSidebarOffset()), referencePos, ((ctx.canvas.width) - (getSidebarOffset())), cellHeight_);
	ctx.stroke();
	referencePos = (referencePos + cellHeight_);
    }while(referencePos <= ctx.canvas.height);

    //ruler
    referencePos = (getSidebarOffset());
    timelineDisplay_ = -1; //so first label is zero
    do{
	ctx.fillText(getTimelineDisplay(timelineDisplay_), referencePos, getRibbonOffset(), getCellWidth(1));
	referencePos = (referencePos + getCellWidth(1));
    }while(referencePos <= ctx.canvas.width);

    //little black box
    ctx.fillStyle = "black";
    ctx.fillRect(0, 0, getSidebarOffset(), getRibbonOffset());
    ctx.stroke();
    
    //sidebar
    ctx.rect(0, (getRibbonOffset()), (getSidebarOffset()), ((ctx.canvas.height) - getRibbonOffset()));
    ctx.stroke();

    //draw ruler selection
    if(ruler_.selection != null){
	ctx.fillStyle = "rgba(255, 0, 0, 0.3)";
	console.log(ruler_.xEnd);
	ctx.fillRect((getCellWidth(ruler_.xStart) + getSidebarOffset()), getRibbonOffset(), getCellWidth(ruler_.xEnd - ruler_.xStart + 1),( ctx.canvas.height - getRibbonOffset()));
	ctx.stroke();
	hideButton.disabled = false;
    }else{
	hideButton.disabled = true;
    }


    // draw all shapes
    var l = shapes.length;
    for (var i = 0; i < l; i++) {
      var shape = shapes[i];
      // We can skip the drawing of elements that have moved off the screen:
      if (getCellX(shape.x) > ctx.canvas.width || getCellY(shape.y) > ctx.canvas.height ||
          getCellX(shape.x) + getCellWidth(shape.w) < getSidebarOffset() || getCellY(shape.y) + getCellHeight(shape.h) < getRibbonOffset) continue;
      shapes[i].draw(ctx);
    }
   
    ctx.strokeStyle = 'red';

    // draw selection
    // right now this is just a stroke along the edge of the selected Shape
    if (this.selection != null) {
	if(delete_){
	    this.shapes.splice(this.shapes.indexOf(this.selection), 1);
	    this.selection = null;
	}else{
	    ctx.strokeStyle = this.selectionColor;
	    ctx.lineWidth = this.selectionWidth;
	    var mySel = this.selection;
	    ctx.strokeRect(getCellX(mySel.x), getCellY(mySel.y), getCellWidth(mySel.w),getCellHeight(mySel.h));
	}
    }

    
    // ** Add stuff you want drawn on top all the time here **
    
    this.valid = true;
    scaleIsValid_ = true;
    if(delete_){
	delete_ = false;
	this.valid = false;
    }
  }
}


// Creates an object with x and y defined, set to the mouse position relative to the state's canvas
// If you wanna be super-correct this can be tricky, we have to worry about padding and borders
CanvasState.prototype.getMouse = function(e) {
  var element = this.canvas, offsetX = 0, offsetY = 0, mx, my;

  
  // Compute the total offset
  if (element.offsetParent !== undefined) {
    do {
      offsetX += element.offsetLeft;
      offsetY += element.offsetTop;
    } while ((element = element.offsetParent));
  }

  // Add padding and border style widths to offset
  // Also add the <html> offsets in case there's a position:fixed bar
  offsetX += this.stylePaddingLeft + this.styleBorderLeft + this.htmlLeft;
  offsetY += this.stylePaddingTop + this.styleBorderTop + this.htmlTop;

  mx = e.pageX - offsetX;
  my = e.pageY - offsetY;
  
  // We return a simple javascript object (a hash) with x and y defined
  return {x: mx, y: my};
}
function loadMacro(){
    if(verbose){console.log("loadMacro()");}

}

function saveMacro(){
    if(verbose){console.log("saveMacro()");}

}

function loadPinsFromServer(){
    if(verbose){console.log("loadPinsFromServer()");}
    var receive = new XMLHttpRequest();
    receive.onreadystatechange = function () {
        if (receive.readyState == 4 && receive.status == 200) {
	    availablePins_ = JSON.parse(receive.responseText);   
        }
    }
    receive.open("GET", hostname + "/getPins", true);
    receive.send();

    console.log(availablePins_);

    alert("Loading Pins Complete!");
    return;
}

function loadCommandsFromServer(){
    if(verbose){console.log("loadCommandsFromServer()");}
    /*var receive = new XMLHttpRequest();
    receive.onreadystatechange = function () {
        if (receive.readyState == 4 && receive.status == 200) {
	    rows_ = JSON.parse(receive.responseText);
	    
        }
    }
    receive.open("GET", hostname + "/getCommands", true);
    receive.send();
    */
    var commandList = [1, 2, 3, 4, 5, 6, 7];
    var commandMenu = document.getElementById('commandOptions');
    for(var a = 0; a < commandList.length; a++){
	var option = document.createElement("option");
	option.text = commandList[a] + " x 1";
	option.value = commandList[a];
	commandMenu.add(option);
    }
    alert("Loading Commands Complete!");
    return;
}

function addCommandToStoryboard(){
    if(verbose){console.log("addCommandToStory()");}
    var dropdown = document.getElementById("commandOptions");
    s.addShape(new Shape(0, 0, dropdown.options[dropdown.selectedIndex].value, 1));
    //  s.addShape(new Shape(0,0,1,1));
    
}

function deleteCommand(){
    if(verbose){console.log("deleteCommand()");}
    delete_ = true;
    scaleIsValid_ = false;
}

function decreaseXScale(){
    X_SCALE_ -= 0.1;
    scaleIsValid_ = false; 
    updateCellDimensions();
    return;
}

function increaseXScale(){
    X_SCALE_ += 0.1;
    scaleIsValid_ = false;
    updateCellDimensions();
    return;
}

function decreaseYScale(){
    Y_SCALE_ -= 0.1;
    scaleIsValid_ = false;
    updateCellDimensions();
    return;
}

function increaseYScale(){
    Y_SCALE_ += 0.1; 
    scaleIsValid_ = false;
    updateCellDimensions();
    return;
}

function getCellWidth(cellsLong){
    return (cellWidth_ * cellsLong);
}

function getCellHeight(cellsHigh){
    return (cellHeight_ * cellsHigh);
}

function updateCellDimensions(){
    cellWidth_ = ((window.innerWidth / 25) * X_SCALE_);
    cellHeight_ = ((window.innerHeight / 12.5) * Y_SCALE_);
}

function getCellX(x){
    return (getSidebarOffset() + (getCellWidth(Math.round(x))));
}

function getCellY(y){
    return (getRibbonOffset() + (getCellHeight(Math.round(y-1))));
}

function getSidebarOffset(){
    return (window.innerWidth / 12.5);
}

function getRibbonOffset(){
    return (window.innerHeight / 12.5);
}

function getTimelineDisplay(){
    
    if(hidden_.indexOf(timelineDisplay_+ 1) > -1){
	timelineDisplay_ = hidden_[hidden_.indexOf(timelineDisplay_+1)+1];
    }
	timelineDisplay_++;
	return (timelineDisplay_);
    
}

function hide(){
    hidden_.push(ruler_.xStart);
    hidden_.push(ruler_.xEnd);
    console.log("Hide " + ruler_.xStart + "-" + ruler_.xEnd);
    document.getElementById('unhideButton').disabled = false;
    scaleIsValid_ = false;
    return;
}

function unhide(){
    while(hidden_.length > 0){
	hidden_.pop();
    }
    scaleIsValid_ = false;
    document.getElementById('unhideButton').disabled = true;;

    return;
}

function init() {
  s = new CanvasState(document.getElementById('storyboard'));
  hideButton = document.getElementById('hideButton');
  s.addShape(new Shape(2, 2, 2, 1)); // The default is gray
  s.addShape(new Shape(2,5,3,1, 'lightskyblue'));
  // Lets make some partially transparent
  s.addShape(new Shape(3,6,2,2));
  s.addShape(new Shape(4,8,4,1));
  cellWidth_ = ((window.innerWidth / 25) * X_SCALE_);
  cellHeight_ = ((window.innerHeight / 12.5) * Y_SCALE_);
}

// Now go make something amazing!