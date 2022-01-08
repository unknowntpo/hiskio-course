docker run -d --net=container:hwchiu --name hwchiu1 hwchiu/netutils
docker run -d --net=container:hwchiu --name hwchiu2 hwchiu/netutils

docker ps | grep hwchiu

# observe container network card inside two container

docker exec -it hwchiu1 ifconfig
docker exec -it hwchiu2 ifconfig

# use ping 8.8.8.8 in hwchiu1 and observe RX packets:<num> in hwchiu2

# in hwchiu1
ping 8.8.8.8

# delete hwchiu1, we found that hwchiu2 doesn't have eth0 (which is in hwchiu1's namespace)
