#!/bin/bash

# Navigate to the backend directory if not already there
cd "$(dirname "$0")"

echo "🚀 Starting UsafiLink Services..."

# 1. Start Celery Worker in the background
# We use --concurrency=1 to stay within Render's free tier memory limits
echo "👷 Starting Celery Worker..."
celery -A backend worker --loglevel=info --concurrency=1 &

# 2. Start Celery Beat in the background (for periodic tasks like driver timeouts/cleanups)
echo "⏰ Starting Celery Beat..."
celery -A backend beat --loglevel=info --scheduler django_celery_beat.schedulers:DatabaseScheduler &

# 3. Start Gunicorn in the foreground
# This must be the last command and remain in the foreground so the Render service stays alive
echo "🌐 Starting Gunicorn Web Server..."
exec gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT --timeout 120
