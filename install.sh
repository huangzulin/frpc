#!/bin/sh

ARCH="amd64"
FRP_VERSION="0.32.1"

if [[ -n "${TARGETPLATFORM}" ]]; then
    echo ${TARGETPLATFORM}
    if [${TARGETPLATFORM} == "linux/amd64"]; then
    $ARCH = "amd64"
    fi
    if [${TARGETPLATFORM} == "linux/386"]; then
    $ARCH = "386"
    fi
    if [${TARGETPLATFORM} == "linux/arm64"]; then
    $ARCH = "arm64"
    fi
    if [${TARGETPLATFORM} == "linux/arm/v7"]; then
    $ARCH = "arm"
    fi
    if [${TARGETPLATFORM} == "linux/arm/v6"]; then
    $ARCH = "arm"
    fi
fi

echo ${ARCH}


apk add --no-cache wget
wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_${ARCH}.tar.gz \
-e use_proxy=yes -e http_proxy=http://192.168.1.101:7890 -O frp.tar.gz
tar xzf frp.tar.gz
rm -rf frp.tar.gz
apk del wget

mv frp_${FRP_VERSION}_linux_${ARCH}/frps /usr/local/frpc
chmod +x /usr/local/frpc
rm frp_* -rf

mkdir -p /etc/frp

cat <<EOT >> /etc/frp/frpc.ini
[common]
EOT