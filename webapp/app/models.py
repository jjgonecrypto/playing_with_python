from django.contrib.auth.models import User
from django.db import models

class Track(models.Model):
    name = models.CharField(max_length=2056)
    href = models.CharField(max_length=2056)
    artist = models.CharField(max_length=2056)
    album = models.CharField(max_length=2056)
    length = models.DecimalField(max_digits=10, decimal_places=2)
    
class Playlist(models.Model):
    #user = models.ForeignKey(User)
    name =  models.CharField(max_length=512)
    tracks = models.ManyToManyField(Track)

    def __unicode__(self):
        return self.name

