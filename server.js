const http = require('node:http');

const server = http.createServer((req, res) => {
  if (req.url === '/api/telemetry.svg') {
    res.setHeader('Content-Type', 'image/svg+xml');
    res.end(`<svg width="400" height="150" xmlns="http://www.w3.org/2000/svg">
      <rect width="100%" height="100%" fill="#0f172a" rx="10"/>
      <text x="20" y="40" fill="#14b8a6" font-family="monospace" font-size="14">● example telemetry data</text>
      <text x="20" y="80" fill="#94a3b8" font-family="sans-serif" font-size="12">EXAMPLE PROFILE VIEWS</text>
      <text x="20" y="110" fill="#e2e8f0" font-family="sans-serif" font-size="28" font-weight="bold">24,891</text>
    </svg>`);
  } else if (req.url === '/api/stack.svg') {
    res.setHeader('Content-Type', 'image/svg+xml');
    res.end(`<svg width="600" height="100" xmlns="http://www.w3.org/2000/svg">
      <rect width="100%" height="100%" fill="#0f172a" rx="10"/>
      <text x="20" y="55" fill="#e2e8f0" font-family="monospace" font-size="16">Java | Python | TS | AI Agents</text>
    </svg>`);
  } else if (req.url === '/api/projects.svg') {
    res.setHeader('Content-Type', 'image/svg+xml');
    res.end(`<svg width="600" height="100" xmlns="http://www.w3.org/2000/svg">
      <rect width="100%" height="100%" fill="#0f172a" rx="10"/>
      <text x="20" y="55" fill="#14b8a6" font-family="monospace" font-size="16">Active Projects: 3</text>
    </svg>`);
  } else {
    res.statusCode = 404;
    res.end('Not Found');
  }
});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
