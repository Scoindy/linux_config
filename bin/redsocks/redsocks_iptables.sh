#!/bin/sh
# A very basic IPtables / Netfilter script

PATH='/sbin'

# Flush the tables to apply changes
iptables -F

iptables -t nat -X REDSOCKS
iptables -t nat -N REDSOCKS
#iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
#iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
#iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
#iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
#iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
#iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
#iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
#iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN
iptables -t nat -A REDSOCKS -p tcp -o eth0 -j DNAT --to 127.0.0.1:9050
iptables -t nat -A OUTPUT -p tcp -j REDSOCKS
