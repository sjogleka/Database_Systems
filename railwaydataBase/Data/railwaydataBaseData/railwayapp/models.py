from django.db import models
from django.contrib.auth.models import User


'''class Post(models.Model):
    post = models.CharField(max_length=500)
    #user = models.ForeignKey(User)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
'''


class Train(models.Model):
    class Meta:
        db_table = "Train"

