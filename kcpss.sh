killall node
killall server_linux_amd64

nohup node ./server.js -s 0.0.0.0 -p 8081 -m aes-256-cfb -k Ss123456 > ./ssjs.log 2>&1 &
sleep 3
nohup ./server_linux_amd64 -t "127.0.0.1:8081" -l ":8082" -key test -mtu 1350 -sndwnd 2048 -rcvwnd 2048 -crypt none -mode fast2 -dscp 0 -datashard 10 -parityshard 3 -nocomp > ./kcp.log 2>&1 &
