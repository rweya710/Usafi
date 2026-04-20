web: cd backend && gunicorn backend.wsgi:application --bind 0.0.0.0:$PORT --workers 4 --timeout 120
# Note: On Render (when CELERY_TASK_ALWAYS_EAGER=true), Celery runs in synchronous mode via the web process
# The following are only needed if you add a Redis broker for background task processing
# worker: cd backend && celery -A backend worker -l info --concurrency 4
# beat: cd backend && celery -A backend beat -l info --scheduler django_celery_beat.schedulers:DatabaseScheduler
