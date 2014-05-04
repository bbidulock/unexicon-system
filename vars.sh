#!/bin/bash

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# find all the interfaces that are defined in the system with IP addresses
declare -a interfaces scoping external
interfaces=( $(ip -4 addr|sed -n '/^[1-9][0-9]*:/p'|cut -f2 '-d '|sed -n 's/:$//p') )
external=()
for iface in ${interfaces[*]%@*}; do
	addrs=( $(ip -4 addr ls $iface|sed -n -r '/\<inet\>/p'|awk '{print$2}') )
	for addr in ${addrs[*]%/*}; do
		case "$addr" in
		0.*)					;; # 0/8
		10.55.7.[123])				vpnserver=( ${vpnserver[*]} $iface )	;;
		10.55.7.*)				vpnclient=( ${vpnclient[*]} $iface )	;; # 10.55.7/24 (Unexicon VPN)
		10.*)					internal=( ${internal[*]} $iface )	;; # 10/8
		127.*)					;; # 127.0/8
		169.254.*)				linklocal=( ${linklocal[*]} $iface )	;; # 169.254/16
		172.1[6-9].*|172.2[0-9].*|172.3[0-1].*)	internal=( ${internal[*]} $iface )	;; # 172.16/12
		192.168.*)				internal=( ${internal[*]} $iface )	;; # 192.168/16
		192.0.2.*)				;; # 192.0.2/24
		192.0.0.[0-7])				;; # 192.0.0/29
		22[4-9].*|23[0-9].*)			;; # 224/4 (224-239.)
		24[0-9].*|25[0-5].*)			reserved=( ${reserved[*]} $iface )	;; # 240/4 (240-255.)
		24[0-7].*)				reserved=( ${reserved[*]} $iface )	;; # 240/5 (240-247.)
		24[8-9].*|25[0-5].*)			reserved=( ${reserved[*]} $iface )	;; # 248/5 (248-255.)
		*)					external=( ${external[*]} $iface ); break ;;
		esac
	done
done

echo "@def \$EXTERNAL = (${external[*]});"
echo "@def \$VPNCLIENT = (${vpnclient[*]});"
echo "@def \$VPNSERVER = (${vpnserver[*]});"
echo "@def \$LINKLOCAL = (${linklocal[*]});"
echo "@def \$RESERVED = (${reserved[*]});"
echo "@def \$INTERNAL = (${internal[*]});"

