#!/bin/bash
/etc/init.d/privoxy start
go-shadowsocks2 -c 23.83.230.94:443 -cipher AES-256-CFB -password OTAzZGM5ZW -verbose -socks :1080
