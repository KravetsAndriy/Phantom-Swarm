FROM debian:jessie
RUN apt-get update
RUN rm -rf /tmp/*
RUN apt-get install -y libreadline-dev libncurses5-dev libpcre3-dev \
    libssl-dev perl make build-essential wget
RUN wget https://openresty.org/download/openresty-1.11.2.2.tar.gz -P /tmp/openresty/
RUN cd /tmp/openresty/ && tar -xzvf openresty-1.11.2.2.tar.gz
RUN cd /tmp/openresty/openresty-1.11.2.2 && ./configure --with-luajit && make && make install
RUN apt-get install -y curl 
COPY nginx.conf /var/nginx.conf
#COPY ./app /var/app
ENV PATH usr/local/openresty/bin:/usr/local/openresty/nginx/sbin:$PATH
RUN opm get bungle/lua-resty-template
CMD ["nginx", "-c", "/var/nginx.conf", "-g", "daemon off;"]