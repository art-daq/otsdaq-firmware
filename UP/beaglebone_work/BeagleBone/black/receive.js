var dgram = require('dgram');
var fs = require('fs');
var bonescript=require('bonescript');
var delay=50000;//set number delay loops for fast pin play mode

var loadSocket=dgram.createSocket('udp4');
loadSocket.on("listening", function () {
    var address = loadSocket.address();
    console.log("server listening " +
    address.address + ":" + address.port);
});
loadSocket.on('message',function(msg,rinfo){
    console.log(msg+' from '+rinfo.address+';'+rinfo.port);
    fs.writeFile('command.json',msg);//you get to store ony 0ne command
});
loadSocket.bind(1212,'192.168.1.80');


var playSocket=dgram.createSocket('udp4');
playSocket.on("listening", function(){
    var address = playSocket.address();
    console.log("server listening " +
    address.address + ":" + address.port);
});
playSocket.on('message',function(msg,rinfo){
    console.log(msg+' from '+rinfo.address+';'+rinfo.port);
    playPins(JSON.parse(msg));
}); 
playSocket.bind(1213,'192.168.1.80');


var commands;

function playPins(msg){//this function initializes the process of playing on the pins
    console.log("work in progress");
    //right now it will only do fast mode

/*example: var command={'depth':2,
	    'loops':500,
	    'interval':10,//in milliseconds
	    'ports':['P8_13','P8_14'],
	    'P8_13':'10',
	    'P8_14':'01'}*/
    var raw_command=JSON.parse(fs.readFileSync('command.json',{'encoding':'ascii'}));
     command={'depth':0,
	     'loops':5000,//default to 5000 maybe it will be an option later maybe we will never even use this
	     'ports':[]}


    for (var i=0;i<raw_command.length;i++){//loop through the signals in a command
	var signal=raw_command[i];
	if (signal[1]>command.depth){command.depth=signal[1];}
	var pinSeqs=signal[3];//list of bit sequences that are do not coresspond to pins...yet
	var pinIDs=msg[raw_command[i][0]];//index the msg object by name of signal to get the pins the user wants played
        for (q=0;q<pinSeqs.length;q++){
	    command.ports.push(pinIDs[q]);
	    command[pinIDs[q]]=pinSeqs[q];//commands[this pin id]=this pin seq
	}
    }

    var ports=command.ports;
    for(var port=0; port<ports.length; port++){
	bonescript.pinMode(ports[port],bonescript.OUTPUT);
	console.log('port',ports[port]);
    }
    playFast();
}


function playFast(){
    console.log('playing fast');
    var ports=command.ports;
    for(var a=0; a<command.loops; a++){
        for(var bit=0; bit<command.depth; bit++){
	    // for (var q=0;q<delay;q++){Math.random();}//useless delay 
            for(var port=0; port<ports.length; port++){
                bonescript.digitalWrite(ports[port],command[ports[port]][bit]);
            }
        }
    }
}


var currentBit,currentLoop,repVar;//these have to be global
function playBit(){
    var ports=command.ports;
    for(var port=0; port<ports.length; port++){
        bonescript.digitalWrite(ports[port],command[ports[port]][currentBit]);
    }
    currentBit++;
    if (currentBit>=command.depth){
        currentLoop++;
        currentBit=0;
        if (currentLoop>=command.loops) {clearInterval(repVar);}
        else {currentLoop++;}
    }
}


function playSlow(){
    console.log('playing slow');
    currentBit=0;
    currentLoop=0;
    repVar=setInterval(playBit,command.interval);
}

//exports.signal=signal;
//exports.playFast=playFast;
//exports.playSlow=playSlow;
//exports.newI=function(interval){signal.interval=interval;};
//playFast();



