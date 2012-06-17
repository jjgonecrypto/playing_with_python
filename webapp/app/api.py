from tastypie.resources import ModelResource
from app.models import Playlist
from tastypie.authorization import Authorization

class PlaylistResource(ModelResource):
    class Meta:
        queryset = Playlist.objects.all()
        resource_name = 'playlists'
        authorization= Authorization() #note: INSECURE - for demo purposes only
