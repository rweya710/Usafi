import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')
django.setup()

from django.contrib.auth import get_user_model

User = get_user_model()

username = input("Enter admin username: ")
email = input("Enter admin email: ")
password = input("Enter admin password: ")

if User.objects.filter(username=username).exists():
    print(f"User {username} already exists.")
else:
    user = User.objects.create_superuser(
        username=username,
        email=email,
        password=password,
        role='admin',
        is_email_verified=True
    )
    print(f"Admin user {username} created successfully with role 'admin'!")
