from django.conf.urls.defaults import *

from django.contrib import admin
admin.autodiscover()

from tastypie.api import Api
from app.views import IndexView
from app.api import PlaylistResource, TrackResource


v1_api = Api('v1')
v1_api.register(TrackResource())
v1_api.register(PlaylistResource())


urlpatterns = patterns('',
    
    url(r'^$', IndexView.as_view(), name='index'),

    url(r'^api/', include(v1_api.urls)),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
