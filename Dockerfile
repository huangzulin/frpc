FROM alpine:3.8
LABEL author ="huangzulin<335882264@qq.com>" 

ARG TARGETPLATFORM

COPY install.sh .

RUN chmod +x ./install.sh && ./install.sh

VOLUME /etc/frp

CMD /usr/local/frpc -c /etc/frp/frpc.ini