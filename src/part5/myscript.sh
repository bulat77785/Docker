#!/bin/bash
gcc miniserver.c -lpthread -lfcgi -o miniserver
service nginx start
nginx -s reload
spawn-fcgi -p 8080 -n miniserver
