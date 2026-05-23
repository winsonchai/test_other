const http = require('http');
const PORT = process.env.PORT || 8080;

// Accessing a secret securely injected via environment variables
const API_KEY = process.env.DATABASE_DECRYPT_KEY || "fallback-unsafe-local-key";

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end(`winson 12345 App is running on port ${PORT}. Environment initialized securely.\n`);
});

server.listen(PORT, () => {
  console.log(`Server executing safely on port ${PORT}`);
});