#!/bin/bash
set -ux

# Install lego in advance. Also, run the following commands
# sudo /opt/bitnami/letsencrypt/lego --tls --email="sample@sample.co.jp" --domains="two-cats-hc-mm.com" --domains="www.two-cats-hc-mm.com" --path="/opt/bitnami/letsencrypt" run

# Back up existing certificates
sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.crt /opt/bitnami/nginx/conf/bitnami/certs/server.crt.old
sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.key /opt/bitnami/nginx/conf/bitnami/certs/server.key.old

# Overwrite with a new certificate
sudo ln -sf /opt/bitnami/letsencrypt/certificates/two-cats-hc-mm.com.key /opt/bitnami/nginx/conf/bitnami/certs/server.key
sudo ln -sf /opt/bitnami/letsencrypt/certificates/two-cats-hc-mm.com.crt /opt/bitnami/nginx/conf/bitnami/certs/server.crt

# Change file permissions
sudo chown root:root /opt/bitnami/nginx/conf/bitnami/certs/server*
sudo chmod 600 /opt/bitnami/nginx/conf/bitnami/certs/server*
