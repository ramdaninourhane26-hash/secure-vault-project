from django.shortcuts import render
# users/views.py
from django.http import JsonResponse
from .models import User
import json

def login_view(request):
    if request.method == "POST":
        data = json.loads(request.body)

        email = data.get("email")
        password = data.get("password")

        try:
            user = User.objects.get(email=email, password=password)
            return JsonResponse({
                "status": "success",
                "user_id": user.id
            })
        except User.DoesNotExist:
            return JsonResponse({
                "status": "error",
                "message": "Invalid credentials"
            })
def profile_view(request, user_id):
    try:
        user = User.objects.get(id=user_id)
        return JsonResponse({
            "id": user.id,
            "role": user.role,
            "join_date": str(user.join_date)
        })
    except User.DoesNotExist:
        return JsonResponse({"error": "User not found"})
