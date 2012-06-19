from tastypie.resources import ModelResource
from tastypie import fields
from app.models import Playlist, Track
from tastypie.authorization import Authorization


class TrackResource(ModelResource):
    class Meta:
        queryset = Track.objects.all()
        resource_name = 'track'
        authorization= Authorization() #note: INSECURE - for demo purposes only

class PlaylistResource(ModelResource):
    tracks = fields.ToManyField(TrackResource, 'tracks', full=True)
    
    class Meta:
        queryset = Playlist.objects.all()
        resource_name = 'playlist'
        authorization= Authorization() #note: INSECURE - for demo purposes only
