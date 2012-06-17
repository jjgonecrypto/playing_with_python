from django.contrib.auth.models import User
from django.db import models

class Entry(models.Model):
    name = models.CharField(max_length=512)
    href = models.CharField(max_length=2056)

class Playlist(models.Model):
    #user = models.ForeignKey(User)
    name =  models.CharField(max_length=512)
    entries = models.ManyToManyField(Entry)

    def __unicode__(self):
        return self.name