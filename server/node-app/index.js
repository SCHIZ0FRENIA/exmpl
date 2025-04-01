const http = require('http');

const server = http.createServer((req, res) => {
  const hostname = process.env.HOSTNAME || 'Unknown';
  const serverNumber = hostname.split('-').pop() || 'Unknown';
  
  console.log(`Request received on Server ${serverNumber}`);

  if (req.url === '/') {
    res.end(`Hello from Server ${serverNumber}\n`);
  } else if (req.url === '/about') {
    res.end(`This is Server ${serverNumber}\n`);
  } else {
    res.statusCode = 404;
    res.end('Not Found\n');
  }
});

server.listen(3000, () => {
  console.log('Server running on port 3000');
});