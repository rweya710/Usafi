web: cd backend && gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT --workers 4 --timeout 120
worker: cd backend && celery -A backend worker -l info --concurrency 4
beat: cd backend && celery -A backend beat -l info --scheduler django_celery_beat.schedulers:DatabaseScheduler
