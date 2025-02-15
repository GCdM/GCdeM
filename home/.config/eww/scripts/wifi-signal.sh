#!/usr/bin/bash
nmcli -terse -fields SIGNAL,ACTIVE device wifi | awk --field-separator ':' '{if($2=="yes")print$1}'
