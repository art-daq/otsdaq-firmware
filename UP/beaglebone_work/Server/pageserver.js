var path = require("path");
var fs = require("fs");

// Serves the page by returning the html.
var serve = function(path) {

    var html = "";
    var return_code=200;
    try {
        html = fs.readFileSync(path);
    } catch (err) {
        console.log("Reading file was unsuccesful.");
        html = "404 ERROR";
	return_code=404;
    }

    return [html,return_code];
};

// returns the type of file aka filename extension
var reqtype = function(path) {

    var type = "";

    var pathSplit = path.split(".");
    if (pathSplit === 1) {
        // If for somereason no ending, output as plain text file
        type = "plain";
    } else {

        type = pathSplit[1]; // Returns thee part after the "." seperator
    }

    //here it should handle all types but for now just zip
    if (type=="zip" || type=="json"){
	type = "application/"+type;
    }
    else{
	type = "text/"+type;
    }
    console.log("type = " + type);
    return type;
};

exports.serve = serve;
exports.reqtype = reqtype;