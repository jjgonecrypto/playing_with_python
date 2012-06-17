from django.conf.urls.defaults import *

from django.contrib import admin
admin.autodiscover()

from app.api import PlaylistResource
playlist_resource = PlaylistResource()

#import views

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    
    url(r'^$', 'views.home.homepage', name='home'),
    
    (r'^api/', include(playlist_resource.urls)),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
