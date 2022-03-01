# create a new netns named ns1
sudo ip netns add ns1
# create a new netns named ns2
sudo ip netns add ns2
# create a veth pair veth1-veth2
sudo ip link add veth1 type veth peer name veth2
# create a veth pair veth3-veth4
sudo ip link add veth3 type veth peer name veth4
# put veth2 inside ns1 named eth0
sudo ip link set veth2 netns ns1 name eth0
# put veth4 inside ns2 named eth0
sudo ip link set veth4 netns ns2 name eth0
# create linux bridge
sudo ip lik add br0 type bridge
# attach veth1 and veth3 to br0
sudo ip link set veth1 master br0
sudo ip link set veth3 master br0
# set up veth1 veth3 br0
sudo ip link set up dev veth1
sudo ip link set up dev veth3
sudo ip link set up dev br0

## set up veth2
sudo ip netns exec ns1 ip link set up eth0
# set up veth4
sudo ip netns exec ns2 ip link set up eth0

# set up ip address inside ns1 ns2
sudo ip netns exec ns1 ip addr add 10.56.8.4/24 dev eth0
sudo ip netns exec ns2 ip addr add 10.56.9.5/24 dev eth0
# next : start at ch3.10 03:02
# TODO: Debug the command 
# TODO: use function to make the script easy to use.
