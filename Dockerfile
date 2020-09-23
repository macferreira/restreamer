FROM ubuntu:20.04

RUN apt update && apt install --no-install-recommends -y \
    build-essential git libpcre3-dev libssl-dev zlib1g-dev ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN cd /home && \
    git clone https://github.com/arut/nginx-rtmp-module.git && \
    git clone https://github.com/nginx/nginx.git && \
    cd nginx && \
    ./auto/configure --add-module=../nginx-rtmp-module --with-cc-opt="-Wimplicit-fallthrough=0" && \
    make && \
    make install && \
    cd .. && \
    rm -rf nginx-rtmp-module nginx

COPY http/nginx.conf /usr/local/nginx/conf/nginx.conf

EXPOSE 80
EXPOSE 1935

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
