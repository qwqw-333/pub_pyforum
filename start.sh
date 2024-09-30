#!/bin/sh

# DB migrate
python manage.py makemigrations authentication
python manage.py migrate authentication
python manage.py makemigrations profiles
python manage.py migrate profiles
python manage.py makemigrations
python manage.py migrate

# Create create_superuser
if [ "$DJANGO_SUPERUSER_USERNAME" ] && [ "$DJANGO_SUPERUSER_EMAIL" ] && [ "$DJANGO_SUPERUSER_PASSWORD" ]; then
  python manage.py shell << END
from django.contrib.auth import get_user_model
User = get_user_model()
email = '$DJANGO_SUPERUSER_EMAIL'
name = '$DJANGO_SUPERUSER_USERNAME'
password = '$DJANGO_SUPERUSER_PASSWORD'
if not User.objects.filter(email=email).exists():
    User.objects.create_superuser(name=name, email=email, password=password)
END
fi

# Server start
gunicorn forum-sandbox.wsgi:application --bind 0.0.0.0:8000
