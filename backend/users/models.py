from django.db import models
# users/models.py
from django.db import models

class User(models.Model):
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=100)
    role = models.CharField(max_length=50)
    join_date = models.DateField(auto_now_add=True)

    def str(self):
        return self.email
