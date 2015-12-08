var fs=require('fs');


//example
var signal={'depth':4,
	     'ports':[13,12,15,14],//amount the one needs to be shifted
	     '13':'1010','12':'1100','15':'1110','14':'1000'};

var num_ports=signal.ports.length

var length=0;//length of buffer in bytes
length+=1;//for first byte (number of ports)
length+=4*num_ports;//each port address is for bytes
length+=4;//4 bytes for depth
length+=num_ports*signal.depth;//each 1 or 0 

var buf = new Buffer(length);
var offset=0;
//write byte for num_ports
buf.writeUInt8(num_ports,0);
offset+=1;
//4 byte port addresses
for(var i=0;i<num_ports;i++){
    var shift = signal.ports[i];
    buf.writeUInt32BE((1<<shift),offset);
    offset+=4;
}
//4 bytes for depth
buf.writeUInt32BE(signal.depth*num_ports,offset);//it is times num_ports because there is a byte for every bit for every port
offset+=4;
for(var bit=0; bit<signal.depth; bit++){        
    for(var port=0; port<num_ports; port++){
	//console.log(bit+' '+port);
	//console.log(signal[signal.ports[port]]);
        var character=signal[signal.ports[port]].charAt(bit);
       	buf.write(character,offset,1,'ascii');
	offset+=1;
    }
}

console.log(buf);
fs.writeFile('pindata.txt',buf);
