#!/bin/bash
NODE="Arch"
VMID="105"
API_TOKEN="root@pam!ARCHY2024"
SERVERIP="192.168.50.127
#d0c3cc56-37f2-4254-a1c2-4e65613349e3

curl -s -k -X POST "https://$SERVERIP:8006/api2/json/nodes/$NODE/qemu/$VMID/spiceproxy" \
     -H "Authorization: PVEAPIToken=root@$NODE=$API_TOKEN"
