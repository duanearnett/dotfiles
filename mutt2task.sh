#!/bin/sh
/usr/local/bin/task add +email E-mail: $(grep 'Subject' $* | awk -F: '{print $2}')
