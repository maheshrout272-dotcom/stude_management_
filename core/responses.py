# Handles HTTP responses (sends JSON, errors, etc.)

import json
from core.middleware import add_cors_headers

def send_json(handler, status, data):
    """Send a JSON response with CORS headers."""
    handler.send_response(status)
    handler.send_header("Content-Type", "application/json")
    add_cors_headers(handler)
    handler.end_headers()
    handler.wfile.write(json.dumps(data).encode())

def send_404(handler):
    """Send a 404 Not Found response."""
    handler.send_response(404)
    handler.send_header("Content-Type", "text/html")
    add_cors_headers(handler)
    handler.end_headers()
    handler.wfile.write(b"404 Not Found")