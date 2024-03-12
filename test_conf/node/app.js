const http = require('http'); 
  
const server = http.createServer((req, res) => {
  // Set the response HTTP header with HTTP status and Content type
  res.writeHead(200, {'Content-Type': 'text/plain'});

  // Send the response body "Current time in KST: {current time}"
  res.end(`Current time in KST: ${new Date().toLocaleString("en-US", {timeZone: "Asia/Seoul"})}`);
});

// Define the port number
const port = 3000;

// Listen to port
server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});
