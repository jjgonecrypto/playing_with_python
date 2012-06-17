# Django settings for playing_with_python project.
import os
from settings import *

import dj_database_url
DATABASES = {'default': dj_database_url.config(default='postgres://localhost')}

PIPELINE_COFFEE_SCRIPT_BINARY = '/app/bin/coffee'
PIPELINE_STYLUS_BINARY = '/app/bin/stylus'