export default function handler(_req, res) {
  res.setHeader('Content-Type', 'image/svg+xml');
  res.send(`<svg width="400" height="150" xmlns="http://www.w3.org/2000/svg">
    <rect width="100%" height="100%" fill="#0f172a" rx="10"/>
    <text x="20" y="40" fill="#14b8a6" font-family="monospace" font-size="14">● live telemetry</text>
    <text x="20" y="80" fill="#94a3b8" font-family="sans-serif" font-size="12">PROFILE VIEWS</text>
    <text x="20" y="110" fill="#e2e8f0" font-family="sans-serif" font-size="28" font-weight="bold">24,891</text>
  </svg>`);
}
