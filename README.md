# What is this service?

This service helps players choose the best hero or champion for their Dota 2 or League of Legends matches.

It queries public APIs, analyzes both allied and enemy picks, and recommends the most suitable heroes for your role.

# Running locally

A this point: 

1. Clone the repository
2. Go to the project directory
3. Run: `fastapi dev`

# Endpoints

As of now:
- "/" just basic info
- "/health" service health

# Plans

Most important:
- Make League of Legends endpoint
- Make Dota 2 endpoint
- Build a Google Sheet serving as a client
- Wrap it up in Docker
- Deploy on my VPS