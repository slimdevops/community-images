const http = require('http');

console.log("Starting Server");
const requestListener = function (req, res) {
  res.writeHead(200);
  res.end('Hello, World!');
}

const server = http.createServer(requestListener);
server.listen(9001, "0.0.0.0", (event) => {
  console.log("Server Started");
});
