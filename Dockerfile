FROM alpine:3.8
LABEL author ="huangzulin<335882264@qq.com>" 

COPY install.sh .

VOLUME /etc/frp

CMD /usr/local/frpc -c /etc/frp/frpc.ini