var rows_ = [];
var trueRow_;
var pinLimit_ = 100;
var a = 0; //counter variable for loops
var b = 0;
var NAME_ = 0;
var DEPTH_ = 1;
var FORMAT_ = 2;
var BITS_ = 3;
var SCALE_ = 50; 
var which;
var formatOptions;
var save_;
var load_
var verbose = false;
var xmlDebug = false;
var headerCanvas_;
var displayPinData_ = 1;
var hostname = "localhost:8888";




/*
Data Structure:

A 3-Dimensional Array is employed to store all the info required for the Signals GUI

First Level: Each Signal
Second Level: 0 = Signal Name
              1 = depth
              2 = format for displaying signal value
              3 = array of bit values
Third Level: ^^^^^^^^^^^^^^^^^^^^^^^^
*/

/*function buttonHandler() {
    $("#addButton").one('click', function () {
        getBitsInNewChannel();
    });
}*/

function init() {

 

    //get global valuables
    draw();

    headerCanvas_ = document.getElementById("headerCanvas");
    headerCanvas_.addEventListener("mousedown", getPosition, false);


}

function eventHandler(commandType, signalID, pinID)
{
    if (verbose) {
        console.log("EventHandler()");
        console.log(commandType);
    }
    if (commandType == "load") {
        load();
        console.log("eventHandler: load()");
        draw();
    } else if (commandType == "save") {
        save();
    } else if (commandType == "refresh") {
        draw();
    }else if (commandType == 'addRow') {
        var bits = 0;
        bits = getBitsInNewChannel();
        addRow();
        addBit(bits);
        draw();
    } else if (commandType == 'delRow' && signalID !== null) {
        delRow(signalID);
        draw();

    } else if (commandType == "convertValue") {
        if (verbose) { console.log("Initiating convert-value..."); }
        convertValue(signalID);
        draw();

    } 
}

function getPosition(event) {
    var x = event.x;
    var y = event.y;

    var parent = headerCanvas_.parentNode;
    var rect = parent.getBoundingClientRect();
    if (verbose) { console.log(rect.top, rect.right, rect.bottom, rect.left); }
    x -= headerCanvas_.offsetLeft + rect.left;
    y -= headerCanvas_.offsetTop;

    displayPinData_ = Math.floor(x / SCALE_);
    if (verbose) { console.log("displayPinData_: " + displayPinData_); }
    draw();
   
    

    for (a = 0; a < rows_.length; a++) {
        for (b = 0; b < rows_[a][BITS_].length; b++) {
            var id = "canvasId" + a + "." + b;
            if (verbose) { console.log(id); }
            var c = document.getElementById(id);
            ctx = c.getContext("2d");
            ctx.moveTo(x, 0);
            ctx.lineTo(x, 450);
            ctx.stroke();
        }
    }
}

function save() {

    updateData();
    /*
    xmlSave_ = "<beaglebone>";
    for (a = 0; a < rows_.length; a++) {
        xmlSave_ += "<signal>";
        addNode("name", rows_[a][NAME_]);
        addNode("depth", rows_[a][DEPTH_]);
        addNode("format", rows_[a][FORMAT_]);
        xmlSave_ += "<values>";
        for (b = 0; b < rows_[a][BITS_].length; b++) {
            addNode("pin", rows_[a][BITS_][b]);
        }
        xmlSave_ += "</values>"
        xmlSave_ += "</signal>";
    }
    xmlSave_ += "</beaglebone>";
   
    */
    //sendToServer
    var send = new XMLHttpRequest();
    save_ = JSON.stringify(rows_);
    if (xmlDebug) { console.log(save_); }

    send.open("POST", hostname + "/saveCommand?name=" + prompt("", "Save command as..."), true);
    send.send(save_);

    

}

function load() {
    var receive = new XMLHttpRequest();
    receive.onreadystatechange = function () {
        if (receive.readyState == 4 && receive.status == 200) {
             rows_ = JSON.parse(receive.responseText);
            
        }
    }
    receive.open("GET", hostname + "/loadCommand?name=" + prompt("", "Load command..."), true);
    receive.send();

    alert("Loading Complete!");
    return;
}

function addNode(node, value) {
    xmlSave_ += "<" + node + ">" + value + "<" + node + ">";
}

function getBitsInNewChannel()
{
    return prompt("", "Number of Pins in Signal " + (rows_.length) + " |" + (pinLimit_ - pinsUsed()) + " pins remaining");
  
    
}

function pinsUsed() {

    var pinsUsed = 0;
    for (var i = 0; i < rows_.length; i++) {
        if (verbose) { console.log(); }
        for (var j = 0; j < (rows_[i][BITS_].length) ; j++) {
            pinsUsed++;
        }
    }

    return pinsUsed;
}

function addRow() {
    rows_.push([1]);
    var name = "Signal #" + (rows_.length - 1);
    rows_[rows_.length - 1][0] = (name);
    rows_[rows_.length - 1].push(256);
    rows_[rows_.length - 1].push("hex");
    rows_[rows_.length - 1].push([]);

}

function addBit(numberOfBits) {
    
        //We determined which is the actual row of the 'Add Channel' button clicked
        //now we just have to add a new channel-formatted row after this new found row number
        for (a = 0; a < numberOfBits; a++) {
            if (verbose) { console.log("a =" + a); }
                if (verbose) {console.log(rows_[rows_.length - 1][BITS_]);}
            rows_[rows_.length - 1][BITS_].push("Unknown");
        }
        

    }


function printRows_() {
    for (var i = 0; i < rows_.length; i++) {
        for (var j = 0; j < rows_[i].length; j++) {
            if (verbose) { console.log("(" + i + "," + j + ")"); }
        }
    }
}

function delRow(channelNumber) {
   
    rows_.splice(channelNumber, 1);
    printRows_();

}

function setPin(signalID, pinID, clock, value) {

    if (rows_[signalID][BITS_][pinID] == "Unknown") {
        rows_[signalID][BITS_][pinID] = 0;
    }
    if (verbose) {
        console.log("Current Value: " + rows_[signalID][BITS_][pinID]);
        console.log("Depth: " + rows_[signalID][BITS_][pinID].toString().length);
        console.log("Clock: " + clock);
    }

    console.log("Clock = " + clock);
    while (rows_[signalID][BITS_][pinID].toString().length <= clock) {
        rows_[signalID][BITS_][pinID] = rows_[signalID][BITS_][pinID] * 10;
        if (value == 1) {
            rows_[signalID][BITS_][pinID] = rows_[signalID][BITS_][pinID] + 1;
        }//add a default zero on a new clock
    }
    if (verbose) { console.log(rows_[signalID][BITS_][pinID]);}
    rows_[signalID][BITS_][pinID] = (Math.floor(rows_[signalID][BITS_][pinID] / 10) * 10) + value;
    if (verbose) { console.log("setPin():" + signalID + "." + pinID + " = " + rows_[signalID][BITS_][pinID]); }


}

function canvasDraw(signalID, pinID) {

  /*  var id = "canvasId" + signalID + "." + pinID;
    var c = document.getElementById(id);
    var ctx = c.getContext("2d");

    
    if (rows_[signalID][BITS_][pinID] !== "Unknown") {
        if (verbose) { console.log(rows_[signalID][BITS_][pinID]); }
        for (a = 0; a < rows_[signalID][BITS_][pinID]; a++) {
            ctx.moveTo(a * 25, 0);
            ctx.lineTo(a * 25, 150);
            ctx.stroke();
        }
    }*/
        
    

}

function canvasHandler(signalID, pinID){

    

}

function canvasEventHandler(evt) {
    if (verbose) { console.log("canvasEventHandler()");
        console.log(evt.target.canvasID);
    }
    var c = document.getElementById(evt.target.canvasID);
    var ctx = c.getContext("2d");

    if (verbose) { console.log(c);}

    var parent = c.parentNode;
    var rect = parent.getBoundingClientRect();
    if (verbose) { console.log(rect.top, rect.right, rect.bottom, rect.left); }
    var x = evt.x - rect.left;
    var y = evt.y - rect.top;

    if (verbose) { console.log("X: " + x + "; y: " + y); }

    if (y >= 50) {
        //0
        if (verbose) { console.log("0: " + Math.round(x / 50) * 50)}

        setPin(evt.target.signalID, evt.target.pinID, (Math.floor(x / SCALE_)), 0);
    } else {
        //1
        if (verbose) { console.log("1: " + Math.round(x / 50) * 50) }
	console.log("x: " + evt.x);
        setPin(evt.target.signalID, evt.target.pinID, (Math.floor(x / SCALE_)), 1);
    }

    draw();

}

function addCanvasListeners() {

    headerCanvas_ = document.getElementById("headerCanvas");
    headerCanvas_.addEventListener("mousedown", getPosition, false);

    for (a = 0; a < rows_.length; a++) {
        for (b = 0; b < rows_[a][BITS_].length; b++) {
            var id = "canvasId" + a + "." + b;
            if (verbose) { console.log(id); }
            var c = document.getElementById(id);
            c.addEventListener("mousedown", canvasEventHandler, false);
            c.canvasID = id;
            c.signalID = a;
            c.pinID = b;
        }
    }

}

function value  (signalNumber, pinNumber) {
    return rows_[signalNumber][BITS_][pinNumber];
}

function valuetoCanvas(signalNumber, pinNumber) {
    return rows_[signalNumber][BITS_][pinNumber];
}

function convertValue(signalID, pinID){
    which = "valueFormat" + signalID;
    if (verbose) { console.log(document.getElementById(which).value); }

    if (document.getElementById(which).value == "binary") {
        for(a = 0; a < rows_[signalID][BITS_].length; a++)
        {
            console.log()
            //rows_[signalID][BITS_][a] = 1;
        }
    } else if (document.getElementById(which).value == "hex") {
        for (a = 0; a < rows_[signalID][BITS_].length; a++) {
            //rows_[signalID][BITS_][a] =  - 1;
        }
    }
}

function getPinData(signalID, pinID) {

    if (verbose) { console.log("displayPinData_ = " + displayPinData_);}

    if (rows_[signalID][BITS_][pinID] == "Unknown") {
        return "U";
    } else {
        for (a = rows_[signalID][BITS_][pinID].toString().length; a > 0; a--) {


            if (verbose) { console.log("rows_[signalID][BITS_][pinID].toString().length - a = " + rows_[signalID][BITS_][pinID].toString().length - a); }
            if (rows_[signalID][BITS_][pinID].toString().length - a == displayPinData_) {
                var digit = ('' + rows_[signalID][BITS_][pinID])[rows_[signalID][BITS_][pinID].toString().length - a];
                if (verbose) { console.log("Digit: " + digit); }
                return digit;
            } else {
                return "U";
            }
        }
    }


}

function getSignalValue(signalID) {

    var signalValue = 0;
    var binaryValue = '';
    if (true) { console.log("================="); }
  
    for (b = 0; b < rows_[signalID][BITS_].length; b++) {
        console.log("b = " + b);

            binaryValue += (getPinData(signalID, b));
            //signalValue = signalValue + parseInt(rows_[signalID][BITS_][a]);
            //var digit = ('' + rows_[signalID][BITS_][pinID])[rows_[signalID][BITS_][pinID].toString().length - a];
            if (verbose) {
                console.log("rows_[signalID][BITS_].length = " + rows_[signalID][BITS_].length);
                console.log("getSignalValue(): " + (getPinData(signalID, b)));
                console.log("binaryValue = " + binaryValue);
            }
        
    }
    if (verbose) { console.log("signalValue: " + signalValue); }
    return binaryValue;
}

function getFormat(signalID) {
    if (rows_[signalID][FORMAT_] == "binary") {
        return '<option selected="selected" value="binary">Binary</option><option value="hex">Hex</option>"'
    } else if (rows_[signalID][FORMAT_] == "hex") {
        return '<option selected="selected" value="hex">Hex</option><option value="binary">Binary</option>"'
    }
    if (verbose) { console.log(formatOptions); }

}

function updateData() {
    for(a = 0; a < (rows_.length); a++)
    {
        //signal name
        which = "Signal #" + a;
        if (document.getElementById(which) !== null && document.getElementById(which).value !== null) {
            
            if (verbose) { console.log("a " + a); }
                if (verbose) {console.log("name: " + document.getElementById(which));}
            rows_[a][NAME_] = document.getElementById(which).value;
        }
        //value format
        which = "valueFormat" + a;
        if (document.getElementById(which) !== null && document.getElementById(which).value !== null) {

            if (verbose) {
                console.log("format: " + document.getElementById(which).value);
            }
            rows_[a][FORMAT_] = document.getElementById(which).value;
        } 

        //pinValue
        for (b = 0; b < rows_[a][BITS_].length; b++) {

        which = "pinValue" + a + "." + b;
        if (document.getElementById(which) !== null && document.getElementById(which).value !== "Unknown") {

            //rows_[a][BITS_][b] = document.getElementById(which).value;
            if (verbose) {
                console.log(which);
                console.log(document.getElementById(which).value);
            }
        }
        }
        

    }
}

function draw(){
    //save names before deleting
    updateData();
    //clear
    $('#sigTbl').html("");
    $('#sigTbl').append('<tr><th><button onclick="eventHandler(\'save\')">Save</button><button onclick="eventHandler(\'load\')">Load</button></th><th><button onclick="eventHandler(\'refresh\')">Refresh</button></th><th>c</th><th>d</th><th align="right">' + pinsUsed() + '| ' + pinLimit_ + '</th></tr>');
    $('#sigTbl').append('<tr><th class="buttonColumn"></th><th class="signal">Signal</th><th class="channel">Channel #</th><th class="value">Value</th><th class="data" id="signalHeader"><div height="30px" style="overflow:hidden;"><canvas id="headerCanvas" height="30px" width="4000"></canvas></div></th></tr>');

    for (var i = 0; i < rows_.length; i++) {
        $('#sigTbl').append('<tr class="signal"><th class="clearCell"><button id="delRow" type="button" onclick="eventHandler(\'delRow\', ' + (i) + ')">Delete Row</button></th><th class="clickable' + (i) + '"><input type="text" class="fill" id="' + 'Signal #' + i + '" name="' + rows_[i][NAME_] + '" value="' + rows_[i][NAME_] + '" </input></th><th class="notChannel">Analog</th><th class="notValue"><p>' + getSignalValue(i) + '</p><select id="valueFormat' + i + '" onchange="eventHandler(\'convertValue\',' + i + ')">' + getFormat(i) + '</select></th><th></th></tr>');
        if (verbose) { console.log() }
        for (var j = 0; j < (rows_[i][BITS_].length); j++) {
            $('#sigTbl').append('<tr class="channel" id="channel' + j + '"><th class="clearCell"></th> <th>' + j + '</th> <th>' + j + 1 + '</th> <th><input type="text" id="pinValue' + i + '.' + j + '" value="' + getPinData(i, j) + '"</input></th> <th><div style="max:width; overflow:auto;" height="80"><canvas id="canvasId' + i + '.' + j + '" align="left" height="100%" width="' + (document.getElementById("signalHeader").offsetWidth - 3) + '"></canvas></div></th></tr>');
            //canvasDraw(i, j);
            if (verbose) { console.log("(" + i + "," + j + ")"); }
            var id = "canvasId" + i + "." + j;
            if (verbose) { console.log(id); }
            var c = document.getElementById(id);
            if (verbose) { console.log(c); }
            var ctx = c.getContext("2d");
            b = 0;
            var tmp;

            console.log(i + "," + j + ":" + rows_[i][BITS_][j]);
            
            if(rows_[i][BITS_][j] !== "Unknown"){
                for (a = rows_[i][BITS_][j].toString().length; a > 0; a--) {
                    var digit = ('' + rows_[i][BITS_][j])[rows_[i][BITS_][j].toString().length - a];
                    b++;
                    if (verbose) { console.log("b: " + (rows_[i][BITS_][j].toString().length - a)); }
                    
                    if (a < rows_[i][BITS_][j].toString().length) {
                        if (verbose) { console.log("More than one bit: " + (rows_[i][BITS_][j].toString().length - a) * SCALE_);}
                        if ((('' + rows_[i][BITS_][j])[rows_[i][BITS_][j].toString().length - a]) !== (('' + rows_[i][BITS_][j])[rows_[i][BITS_][j].toString().length - (a+1)])) {
                            ctx.moveTo(((rows_[i][BITS_][j].toString().length - a) * SCALE_), 25);
                            ctx.lineTo(((rows_[i][BITS_][j].toString().length - a) * SCALE_), 75);
                            ctx.stroke();
                        }
                    }


                    if(digit == 0){tmp = 75;}
                    else if(digit == 1){tmp = 25;}
                    if (verbose) { console.log("Drawing: " + (b * SCALE_) + "," + ((b * SCALE_) + (rows_[i][BITS_][j].toString().length - a)) + "," + tmp); }
                    ctx.moveTo(((rows_[i][BITS_][j].toString().length - a) * SCALE_), tmp);
                    ctx.lineTo((((rows_[i][BITS_][j].toString().length - a) * SCALE_) + SCALE_), tmp);
                    ctx.stroke();
                    
                }
            }
        }
    }
    //Add Constants: header and 'Add' button

   $('#sigTbl tr').last().after('<tr><th><button onclick="eventHandler(\'addRow\')">Add Row</button></th><th></th><th></th><th></th><th></th></tr>');
    
  
   addCanvasListeners();


}


