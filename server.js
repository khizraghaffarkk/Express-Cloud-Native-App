var express = require('express');
var app = express();

app.use(express.static('public'));

app.get('/index.html', function (req, res) {
   res.sendFile( __dirname + "/" + "index.html" );
});


var server = app.listen(5001, function () {  
   var host = server.address().address;
   var port = server.address().port;
   
   console.log("This Express application listening at", host, port);
});
