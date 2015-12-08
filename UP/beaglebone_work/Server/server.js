//////////////////////////////////////
//Crated at Fermilab for OtsDaq  	//
//Written by Ethan Lewis        	//
//2015                    		    //
// 									//
//Modifications by Brian Yu			//
//									//
// Principal Investigator:			// 
//	Ryan Rivera 					//
//	(rrivera at fnal dot gov)		//
//////////////////////////////////////



var http = require("http"),
    url = require("url"),
    dgram=require('dgram'),
    fs=require('fs'),
    qs = require('querystring'),
    sys = require('sys'),
    exec = require('child_process').exec;
var IP=0;//="131.225.82.252";
var PORT=0;//=1999;

var cactus = require('./src/build/Release/cactus');

var MAX_MASK_LENGTH = 32;


//from https://dzone.com/articles/execute-unix-command-nodejs
function puts(error, stdout, stderr) { sys.puts(stdout) }
//EXAMPLE: exec("ls -la", puts);




function randomString(length){
    var str='';
    var chars="qwertyuiopasdfghjklzxcvbnm1234567890";
    for (var i=0; i < length; i++){
	str += chars[Math.floor(Math.random()*36)];
    }
    return str;
}

// Starts the server
var Start = function(route, serve, reqtype, IPin, PORTin) {
	IP = IPin;
	PORT = PORTin;
	cactus.parse_cactus();
	
    // Lauched when there is a request.
    var onRequest = function(req, res) {

        // Extracts the pathname from the url
    	var info = url.parse(req.url,true);
    	var pathname=info.pathname;

        // Removes the starting "/". If this fails, then that means the request
        // was without
        // the "/", and so does not affect it.
        try {
            pathname = pathname.substring(1, pathname.length);
        } catch (err) {

        }

        // Responds to all requests apart from that for favicon.ico
        if (pathname !== "favicon.ico") {
        	console.log()
            console.log("Request has been recieved. URL: "+info.path);
        	switch(pathname) {
        		case "device_picker/update":
				handleDeviceUpdate(req,res,info);
				break;
			    case "device_picker/device_add":
				handleDeviceAdd(req,res,info);
				break;
			    case "device_picker/device_delete":
				handleDeviceDelete(req,res,info);
				break;
			    case "device_picker/add_format":
				handleDeviceFormatAdd(req,res,info);
				break;
			    case "device_picker/device_names":
				handleDeviceNames(req,res,info);
				break;
			    case "device_picker/one_device":
				handleOneDevice(req,res,info);
				break;
			    case "device_picker/lib_types":
				handleLibTypes(req,res,info);
				break;
			    case "device_picker/find_solutions":
				handleFindSolutions(req,res,info);
				break;
			    case "device_picker/checkout":
				handleCheckout(req,res,info);
				break;
			    case "device_picker/delete_infrastructure":
				handleDeleteInfrastructure(req,res,info);
				break;
				

			    case "cactus_picker/hierarchy":
				handleCactusHierarchy(req,res,info);
				break;
			    case "cactus_picker/generate_source":
				handleCactusGenerate(req,res,info);
				break;
				    
		
		
		
			    case 'playCommand':
				handlePlayCommand(req,res,info);
				break;
			    case 'saveCommand':
				handleSaveCommand(req,res,info);
				break;
			    case 'loadCommand':
				handleLoadCommand(req,res,info);
				break;
			    case 'loadToBeagle':
				handleLoadToBeagle(req,res,info);
				break;
			    case 'getCommands':
				handleGetNames(req,res,info);
				break;
			    case 'getPins':
				handleGetPins(req,res,info);
				break;
			    default:
			    	//Removing '..' from the pathname
			    	var p = pathname.indexOf('..');
			    	while (p >= 0){
				    	pathname = pathname.replace('..','');	
				    	p = pathname.indexOf('..');
			    	}
					console.log("Path has been generated "+ pathname);
			    	console.log("Path did not match any server scripts--- now looking for file to serve");
					// Gets the path from the router
					var path = route(pathname);
					// Gets html or whatever will be written from the pageserver
					var data = serve(path);
					//console.log(JSON.stringify(data)); //CAREFUL this can crash node when big files
					var html = data[0];
					var return_code= data[1];
					console.log("Html has been generated");
			
					// Gets the type from the pageserver
					var type = reqtype(path);
					console.log("Filetype has been found");
			
					// Writes what type of data will be sent. Dynamically sets file
					// ending.
					if (path.search('device_picker')!=-1){
					    res.setHeader('Access-Control-Allow-Origin','http://otsdaq.fnal.gov');
					    		    console.log(html.toString());
					}
			
					res.writeHead(return_code, {
						"Content-Type" : type
						    });
					// writes to output
					console.log("Writing to output");
					res.write(html);
					console.log("Written to output");
					// ends connection
					res.end();
			}//end switch
        	console.log("Request answered successfully");
		}// End the If statement

    };

    http.createServer(onRequest).listen(PORT, IP);
    console.log("Server is running at "+IP+":"+PORT);
    var command = 'lwp-request -m GET -s -u "http://otsdaq.fnal.gov/sandbox/server_registration.php?port=' + PORT + '&ip=' + IP + '&pw=sf98h94w"';
	console.log("Server is registering");
	console.log(command);
    exec(command,puts);
};

function handleGetPins(req,res,info){
    //write now just sending dummy data
    res.writeHead(200,{'Content-Type':'text/plain'});
    console.log("handleGetPins()");
    res.end(JSON.stringify(['P8_13','P8_14','P8_15']));
}


function handleGetNames(req,res,info){
    //Dan's job here
    res.writeHead(200,{'Content-Type':'text/plain'});
    console.log("handleGetName()");
    res.end('this would be data');
}


function handleLoadToBeagle(req,res,info){
    var name=info.query.name;
    console.log("Loading command named \"" + name +"\" to beagle");//added
    var s= dgram.createSocket('udp4');
    var b=new Buffer(fs.readFileSync('commands/'+name+'.json'));
    s.send(b,0,b.length,1212,'192.168.1.80');//this should probably have a callback
    res.writeHead(200,{'Content-Type':'text/plain'});
    res.end('success');
}

function handleLoadCommand(req,res,info){
    var name=info.query.name;
    res.writeHead(200,{'Content-Type':'text/plain'});
    // if(IP == '127.0.0.1') {setHeader('Access-Control-Allow-Origin','http://localhost:50062');}
    console.log("Command: "+name+" requested to load.");
    fs.createReadStream('commands/'+name+'.json').pipe(res);
}

function handleSaveCommand(req,res,info){
    var body='';
    req.on('data', function(data){body+=data;});
    req.on('end', function(){
        console.log(body);
	var name=info.query.name;
	var command=JSON.parse(body);
	console.log("Saving command named \""+name+"\"");
        fs.writeFile('commands/'+name+'.json', body, {"encoding":"ascii"});
	res.writeHead(200,{'Content-Type':'text/plain'});
	res.end('success');
    });
}


function handlePlayCommand(req,res,info){
    var body='';
    req.on('data', function(data){body+=data;});
    req.on('end', function(){
	    console.log("body",body);
	var s= dgram.createSocket('udp4');
        var b=new Buffer(body);
        s.send(b,0,b.length,1213,'192.168.1.80');//this should probably have a callback 
        res.writeHead(200,{'Content-Type':'text/plain'});
	res.end('success');
    });
}

function handleDeviceUpdate(req,res,info){
    var strlib='';
    req.on('data', function(data){strlib+=data;});
    req.on('end', function(){
	console.log("strlib: ",strlib);
	strlib=qs.parse(strlib).data;
	console.log("strlib after qs.parse: ",strlib);
	if (strlib){
	    try{
		JSON.parse(strlib);
		fs.writeFileSync('device_picker/device_library.json',strlib);	
		res.writeHead(200,{"Content-Type":"text/plain",'Access-Control-Allow-Origin':'http://otsdaq.fnal.gov'});
		res.end("success");
	    }
	    catch(err){
		console.log("error parsing JSON or writing to file");
		res.writeHead(500,{"Content-Type":"text/plain",'Access-Control-Allow-Origin':'http://otsdaq.fnal.gov'});
		res.end();
	    }
	}
	});
}
	
function handleDeviceAdd(req,res,info){
    var json_lib=JSON.parse(fs.readFileSync('device_picker/device_library.json'));
    json_lib.devices.push([info.query.device_name,"",[],[],[],0]);
    var str_lib = JSON.stringify(json_lib);
    fs.writeFileSync('device_picker/device_library.json',str_lib);
    res.writeHead(200,{"Content-Type":"text/plain",'Access-Control-Allow-Origin':'http://otsdaq.fnal.gov'});
    res.end("success");
}



function handleDeviceDelete(req,res,info){
    var json_lib=JSON.parse(fs.readFileSync('device_picker/device_library.json'));
    json_lib.devices.splice(info.query.device,1);
    var str_lib = JSON.stringify(json_lib);
    fs.writeFileSync('device_picker/device_library.json',str_lib);
    res.writeHead(200,{"Content-Type":"text/plain",'Access-Control-Allow-Origin':'http://otsdaq.fnal.gov'});
    res.end("success");
}

function handleDeviceFormatAdd(req,res,info){
   var lib=JSON.parse(fs.readFileSync('device_picker/device_library.json'));
   var type_to_add=lib[info.query.type_to_add];
   var name=info.query.name;
   //stored as an array of arrays, each inner array corresponds to a mask
   //if list of masks is empty or length of last mask is already maximum
   if (!type_to_add.length  || type_to_add[type_to_add.length-1].length >= MAX_MASK_LENGTH){
       type_to_add.push([]);//add mask to list of types/formats
       var dev_type;
       for (var d=0; d<lib.length; d++){//add mask to each devices list of masks for this type/format
	   switch(info.query.type_to_add){
	   case "io_formats":
	       for (var t=0;t<lib.devices[d][2].length; t++){
		   lib.devices[d][2][t][2].push(0)}
	       break;
	   case "mem_types":
	       for (var t=0;t<lib.devices[d][3].length; t++){
		   lib.devices[d][3][t][1].push(0)}
	       break;
	   case "bb_types":
	       lib.devices[d][4].push(0);
	       break;
	   }
       }
   }
   type_to_add[type_to_add.length-1].push(name);
 
   var str_lib = JSON.stringify(lib);
   fs.writeFileSync('device_picker/device_library.json',str_lib);
   res.writeHead(302,{"Location":"http://otsdaq.fnal.gov/sandbox/edit_library.html"});
   res.end("success");
}



function handleDeviceNames(req,res,info){
    var devices=JSON.parse(fs.readFileSync('device_picker/device_library.json')).devices;
    var names=[];
    for (var i=0; i<devices.length; i++){
	names.push(devices[i][0]);//the first element of each device array is the name
    }
    res.writeHead(200,{"Content-Type":"application/json","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
    var str_lib=JSON.stringify(names);
    console.log(str_lib);
    res.end(str_lib);
}

function onlyOneDevice(device_index){
    //instead of having a property devices that is a nested array,
    //this library will have a property device that is one array for one device
    //if device index is -1 it will return the lib without any devices (no device prop.)
    var json_lib=JSON.parse(fs.readFileSync('device_picker/device_library.json')).devices[device_index];
    return json_lib;
}

function handleOneDevice(req,res,info){
    json_lib=onlyOneDevice(info.query.device);
    res.writeHead(200,{"Content-Type":"application/json","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
    res.end(JSON.stringify(json_lib));
}

function handleLibTypes(req,res,info){
    var lib_types=JSON.parse(fs.readFileSync('device_picker/device_library.json'));
    delete lib_types.devices;
    res.writeHead(200,{"Content-Type":"application/json","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
    res.end(JSON.stringify(lib_types));
    //    console.log(JSON.stringify(lib_types));
}


function handleCactusHierarchy(req,res,info){
    var lib_types=JSON.parse(fs.readFileSync('cactus_picker/cactus_library.json'));
    delete lib_types.devices;
    res.writeHead(200,{"Content-Type":"application/json","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
    res.end(JSON.stringify(lib_types));
    //    console.log(JSON.stringify(lib_types));
}

function handleCactusGenerate(req,res,info){
	console.log("handleCactusGenerate");
	var postStr='';
    req.on('data', function(data){postStr+=data;});
    req.on('end', function(){
        console.log("Test1");
        var parsedPost;
        if(postStr)
        	parsedPost = JSON.parse(qs.parse(postStr).data);
        console.log("Test1");
        console.log("post data", parsedPost);
        
        res.writeHead(200,{"Content-Type":"text/plain","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
	    res.end("success");
	    
	    var board = parsedPost.board;
	    var project = parsedPost.project;
	    var components = parsedPost.components;

	    console.log("email", parsedPost.email);
	    
	    console.log("board", board);
	    console.log("project", project);
	    console.log("components", components);
	    //return;
	    var command = "../cactusProjectGenerator.py -b " + board + " -p " + project + " -c " + components;
	    //if(project == "strip_mvp")
	    	

	    console.log(command);
	    exec(command, puts);
	    
	    return;
	    //send zip
	    var fileToZip = "Server/user_infrastructures/doit.tcl";
	    var zipFileName = randomString(12);
	    while (fs.exists('./user_infrastructures/'+zipFileName+'.zip')){
		zipFileName=randomString(12);
	    }
	    console.log(zipFileName);
	    res.writeHead(200,{"Content-Type":"text/plain","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
	    res.end("success");
	    console.log("Test3");
	    var command;
	    command = "../zipper.sh "+zipFileName+" "+parsedPost.email +
				" " + IP + " " + PORT + " " + fileToZip;
	    
	    	//here it just gives the beaglebone folder but it will be interesting later
	    console.log(command);
	    exec(command, puts);
	    
	    
    }); 
}


function handleCheckout(req,res,info){
    //cart item is [index, number, "name", [iomask,iomask...],[memmask,..]]
    var postStr='';
    req.on('data', function(data){postStr+=data;});
    req.on('end', function(){
	    var parsedPost = JSON.parse(qs.parse(postStr).data);
	    console.log("Test1");
	    console.log("post data", parsedPost);
	    console.log("Test2");
	    var cart = parsedPost.cart;
	    console.log(cart[0][2]);
	    //create random name for file
	    var zipFileName = randomString(12);
	    while (fs.exists('./user_infrastructures/'+zipFileName+'.zip')){
		zipFileName=randomString(12);
	    }
	    console.log(zipFileName);
	    res.writeHead(200,{"Content-Type":"text/plain","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
	    res.end("success");
	    console.log("Test3");
	    var command;
	    command = "../zipperPicoZed.sh "+zipFileName+" "+parsedPost.email +
				" " + IP + " " + PORT;
	//    if (cart[0][2] == "PicoZed"){
	//		command = "../zipperPicoZed.sh "+zipFileName+" "+parsedPost.email +
	//				" " + IP + " " + PORT;
	//    	console.log("aaa");
	//    }
	//    else{
	//    	command = "../zipper.sh "+zipFileName+" "+parsedPost.email;
	//    	console.log("bbb");
	//    }
	    	//here it just gives the beaglebone folder but it will be interesting later
	    console.log(command);
	    exec(command, puts);
  
    });
}//handleCheckout

function handleDeleteInfrastructure(req,res,info){
    console.log("user_infrastructures/"+info.query.name+".zip");
    //fs.unlink("user_infrastructures/"+info.query.name+".zip",function(err){});
    res.writeHead(200,{"Content-Type":"text/plain"});
    res.end("success");
}

function handleFindSolutions(req,res,info){
    var strreq='';
    req.on('data', function(data){strreq+=data;console.log("partial reqs",data);});
    req.on('end', function(){
	console.log("user reqs: ",strreq);
	strreq=qs.parse(strreq).data;
	console.log("sttreq afeter qs.parse: ",strreq);
	try{
	    var userReqs=JSON.parse(strreq);
	    console.log("JSON-parsed user reqs: ",userReqs); 
	}
	catch(error){
	    console.log("Error parsing JSON.\nCaught Error::"+error);
	    res.writeHead(500,{"Content-Type":"application/json","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
	    res.end();
	    return;
	}
	results=findSolutions(userReqs);
	res.writeHead(200,{"Content-Type":"application/json","Access-Control-Allow-Origin":"http://otsdaq.fnal.gov"});
	var str_results=JSON.stringify(results);
	console.log(str_results);
	res.end(str_results);
    });
}



function findSolutions(userReqs){
    //right now this will find only one possible solution combination
    var memioReqs=userReqs[0];
    var reqsNotFound=[];
    var bbReqs=userReqs[1];
    var lib=JSON.parse(fs.readFileSync("device_picker/device_library.json"));
    var results=[];
    var compatibleDevices=[];
    var resourcesTaken=[];//[[[dev1io1,dev1io2,...],[dev1mem1,dev1mem2,...]],[[dev2io1,dev2io2,...],[dev2mem1,...]],...]
    //resourcesTaken will only have compatible devices in it so the device indexes in it is not the same as in library 
    for (var a=0; a<lib.devices.length; a++) results.push(0);
    for (var d=0; d<lib.devices.length; d++){
	var devBB=lib.devices[d][4];//array of dev's bb masks
	if (bbReqs[0]){//if "and" ie device needs all the bb's selected
	    var devpass=true;
	    for (var m=0; m < devBB.length; m++){
		if ((devBB[m] ^ bbReqs[1][m]) & bbReqs[1][m]){//request has bbs that device does not have
		    devpass=false;
		    break;
		}
	    }
	    if (devpass){
		compatibleDevices.push(d);
		resourcesTaken.push([[],[]]);
	    }
	}
	else{ //"or" ie device needs any of the bbs se;ected
	    for (var m=0; m < devBB.length; m++){	
		if (devBB[m] & bbReqs[1][m]){//if they overlap
		    compatibleDevices.push(d);
		    resourcesTaken.push([[],[]]);
		    break;
		}
	    }
	}
    }
    for (var i=0; i < compatibleDevices.length; i++){
	var d=compatibleDevices[i];
	for (var io=0; io<lib.devices[d][2].length; io++)
	    resourcesTaken[i][0].push(0);
	for (var mem=0; mem<lib.devices[d][3].length; mem++)
	    resourcesTaken[i][1].push(0);
    }
    //console.log("resources taken",resourcesTaken);

 
    for (var i=0; i < compatibleDevices.length; i++){
	var d=compatibleDevices[i];
	var device = lib.devices[d];

	for (var r=0; r < memioReqs.length; r++){
	    //each req is [io or mem, and/or, number of channels/mbs, [first mask,second mask,...]]
	    var isMem = memioReqs[r][0];
	    var isAnd = memioReqs[r][1];
	    var reqSize = memioReqs[r][2];
	    var reqMasks = memioReqs[r][3];
	    var matchFound = false;
	    var bestCompatibleType=-1;//var compatibleTypes=[];//array of this dev's compatible types for this req
	    var minDevsNeeded=0xFFFFFFFF;
	    var thisDevTypes;
	    if  (isMem){
		thisDevTypes = device[3];//array of dev's mem types
	    }
	    else{
		thisDevTypes = device[2];//array of dev's io types
	    }
	    //console.log("r",r,"d",d,"types",thisDevTypes,"reqSize",reqSize,"reqMasks",reqMasks);
	    var LVDS_MASK = 1 << 0; //LVDS is bit position 0 in the mask
	    var isLVDS = reqMasks & LVDS_MASK;
	    if (isLVDS != 0){
		reqSize = reqSize * 2;
	    }
	    for (var t=0; t<thisDevTypes.length; t++){
		var thisFormats=thisDevTypes[t][((isMem)?1:2)];
		var typepass;
		//this next if else tests if the type is compatible with the user's requirements
		if (isAnd){//device needs all the formats selected
		    typepass=true;
		    for (var m=0; m < reqMasks.length; m++){
			if ((thisFormats[m] ^ reqMasks[m]) & reqMasks[m]){//request has formatss that types does not have
			    typepass=false;
			    break;
			}
		    }
		    //if (typepass) compatibleTypes.push(d);
		}
		else{ //device needs any of the types selected
		    typepass=false
		    for (var m=0; m < reqMasks.length; m++){	
			if (thisFormats[m] & reqMasks[m]){//if they overlap
			    //compatibleTypes.push(d);
			    typepass=true;
			    break;
			}
		    }
		}
		if (typepass){//maybe this could go before so that it doesnt need to check compatibility if there exists a more efficient type???
		    //check if this type has a higher capacity
		    //this effeciency test does not take into account resources that are already taken or efficiencies of other devices
		    //that might have to be done at the very end and is difficult...
		    //console.log("For req",r,memioReqs[r],"device",d,"type",t,"was compatible");
		    var devsNeeded =  (resourcesTaken[i][isMem][t]+reqSize) / thisDevTypes[t][0];
		    if ( devsNeeded < minDevsNeeded){
			minDevsNeeded=devsNeeded;
			bestCompatibleType=t;
		    }
		}
	    }//end loop through a device's types
	    if (bestCompatibleType===-1){//delete this device option
		//console.log("no match found for req",r,"device",d);
		//console.log(results,compatibleDevices);
		results[d]=0;
		//console.log(results,compatibleDevices);
		break;//try next device
	    }
	    //console.log("best type",bestCompatibleType);
	    //now account for the size of a users request (channels or Mbs)
	    resourcesTaken[i][isMem][bestCompatibleType]+=reqSize;//this uses i and not d because it contains only compatible devs and not all devs
	    //round upwards
	    if (devsNeeded > results[d])
		results[d]=Math.ceil(minDevsNeeded);
	    matchFound=true;

	}
	
	if (!matchFound){
	    reqsNotFound.push(r);
	}
    }//end reqs loop



	//if is_and==1
	//  if !((dev io ^ io reqs)&io reqs)
	//    pass
	//  else
	//    fail
	//else
	//  if (dev io & io reqs)
	//    pass
	//  else
	//    fail
    var detailedResults=[];//[dev,cnt,name][dev,cnt,name],...]
    for (d=0; d<results.length;d++){
	if (results[d]){
	    detailedResults.push([d,results[d],lib.devices[d][0]]);
	}
    }   
    //console.log("results",results, detailedResults);
    return detailedResults;
}

exports.Start = Start;