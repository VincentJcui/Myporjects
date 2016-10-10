#!/bin/sh
#2016-10-11
uwsgi --http 0.0.0.0:9000 --wsgi-file Manager.py --callable app --processes 4 --threads 4


