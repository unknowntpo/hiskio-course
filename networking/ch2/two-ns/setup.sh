#!/bin/sh
ip netns add hw1
ip netns add hw2

ip link add veth1 type veth peer name veth2

ip link set up dev veth1
ip link set up dev veth2


ip link set netns hw1 dev veth1 name veth0
ip link set netns hw2 dev veth2 name veth0

# Set up dev inside container, if we do this outside the namespace,
# when we move the device into new namespace, it will be down.
ip netns exec hw1 ip link set up dev veth0
ip netns exec hw2 ip link set up dev veth0


ip netns exec hw1 ip addr add 10.55.66.8/24 dev veth0
ip netns exec hw1 ip addr add 10.55.66.9/24 dev veth0
