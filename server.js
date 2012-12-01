var http = require("http");
var area = require("./funcionesExternas");
var temp2 = area.calcularArea(2,2);

http.createServer(function(request,response){
	response.writeHead(200,{"Content-Type": "text/plain"});
	response.write("El area es: " + area.calcularArea(2,2));
	response.end();
}).listen(8888);