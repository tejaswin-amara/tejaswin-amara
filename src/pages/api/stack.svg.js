export default function handler(_req, res) {
  res.setHeader('Content-Type', 'image/svg+xml');
  res.send(`<svg width="600" height="100" xmlns="http://www.w3.org/2000/svg">
    <rect width="100%" height="100%" fill="#0f172a" rx="10"/>
    <text x="20" y="55" fill="#e2e8f0" font-family="monospace" font-size="16">Java | Python | TS | AI Agents</text>
  </svg>`);
}
