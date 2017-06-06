FROM ubuntu:xenial
RUN  apt-get update
RUN  apt-get install privoxy -y
RUN  apt-get install git -y
RUN  apt-get install  golang -y
RUN  mkdir -p /gopath/src/github.com/shadowsocks;
ADD  golang.org.tar   /gopath/src
RUN  cd /gopath/src/github.com/shadowsocks; git clone  https://github.com/shadowsocks/go-shadowsocks2.git; 
RUN  mkdir -p /gopath/src/github.com/Yawning/; cd  /gopath/src/github.com/Yawning; git clone https://github.com/Yawning/chacha20.git
RUN  cd /gopath/src/github.com/shadowsocks/go-shadowsocks2; GOPATH=/gopath  go install; mv /gopath/bin/go-shadowsocks2  /bin
ADD  start_sc.sh  /
ADD  config  /etc/privoxy/config
CMD  ["/start_sc.sh"]
