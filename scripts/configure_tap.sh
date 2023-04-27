#!/bin/bash

# input arguments
ifname=$1   # the name of host eth interface (e.g., eth0)
host_ip=$2  # host_ip address
gateway=$3  # gateway address

# 1. check if armbr0 is already configured
out=$(brctl show | grep armbr0)
user=$(whoami)
if [[ $out == *"armbr0"* ]]; then
	if [[ $out == *"${user}"* ]]; then
		echo "tap network already configured!"
		exit 0
	fi
fi

# 2. create a bridge network
sudo ip link add armbr0 type bridge
sudo ip link set armbr0 up

# 3. reassign IP address to the bridge
sudo ip link set ${ifname} up
sudo ip link set ${ifname} master armbr0

# Drop existing IP from eth0
sudo ip addr flush dev ${ifname}

# Assign IP to armbr0
sudo ip addr add ${host_ip}/24 brd + dev armbr0
sudo ip route add default via ${gateway} dev armbr0

# 4. create a tap device
sudo ip tuntap add dev ARM${user} mode tap user ${user}
sudo ip link set dev ARM${user} up
sudo ip link set ARM${user} master armbr0

