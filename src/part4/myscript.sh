#!/bin/bash
gcc miniserver.c -lfcgi -o miniserver
spawn-fcgi -p 8080 ./miniserver
service nginx start
/bin/bash
