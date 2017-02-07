FROM debian:jessie
RUN apt-get update
RUN rm -rf /tmp/*
RUN apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev \
    libssl-dev perl make build-essential wget
RUN wget https://openresty.org/download/openresty-1.11.2.2.tar.gz -P /tmp/openresty/
RUN cd /tmp/openresty/ && tar -xzvf openresty-1.11.2.2.tar.gz
RUN cd /tmp/openresty/openresty-1.11.2.2 && ./configure --with-luajit && make && make install
COPY nginx.conf /var/app/conf/nginx.conf
COPY main.lua /var/app/conf/main.lua
CMD ["nginx", "-c", "/var/app/conf/nginx.conf", "-g", "daemon off;"]