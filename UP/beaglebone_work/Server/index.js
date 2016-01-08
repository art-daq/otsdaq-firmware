console.log("Creating server");

var IP;//="131.225.82.252";
var PORT=0;//=1999;



var os = require('os');
var ifaces = os.networkInterfaces();

//get system IP address
Object.keys(ifaces).forEach(function (ifname) {
  var alias = 0;

  ifaces[ifname].forEach(function (iface) {
    if ('IPv4' !== iface.family || iface.internal !== false) {
      // skip over internal (i.e. 127.0.0.1) and non-ipv4 addresses
      return;
    }

    if (alias >= 1) {
      // this single interface has multiple ipv4 addresses
      console.log(ifname + ':' + alias, iface.address);
    } else {
      // this interface has only one ipv4 adress
      console.log(ifname, iface.address);
    }
    IP = iface.address;
    ++alias;
  });
});

//get PORT from parameters
process.argv.forEach(function (val, index, array) {
	  console.log(index + ': ' + val);
	});

if(process.argv[2] == "-p") //port option
	PORT = process.argv[3] | 0; //integer port

//PORT default/error case
if(PORT < 1000) //illegal port
	PORT = 1999;


// Gets the required components
var server = require("./server.js");
var router = require("./router.js");
var pageserver = require("./pageserver.js");

// Starts the server.
server.Start(router.route, pageserver.serve, pageserver.reqtype, IP, PORT);console.log("Creating server");
