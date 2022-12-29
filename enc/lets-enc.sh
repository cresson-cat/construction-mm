#!/bin/bash
set -ux

# 前提: 以下を事前に実行
# sudo /opt/bitnami/letsencrypt/lego --tls --email="simple_life_dai@yahoo.co.jp" --domains="two-cats-hc-mm.com" --domains="www.two-cats-hc-mm.com" --path="/opt/bitnami/letsencrypt" run

# 既存の証明書を退避
sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.crt /opt/bitnami/nginx/conf/bitnami/certs/server.crt.old
sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.key /opt/bitnami/nginx/conf/bitnami/certs/server.key.old
# sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.csr /opt/bitnami/nginx/conf/bitnami/certs/server.csr.old

# 新しい証明書により上書き
sudo ln -sf /opt/bitnami/letsencrypt/certificates/two-cats-hc-mm.com.key /opt/bitnami/nginx/conf/bitnami/certs/server.key
sudo ln -sf /opt/bitnami/letsencrypt/certificates/two-cats-hc-mm.com.crt /opt/bitnami/nginx/conf/bitnami/certs/server.crt

# パーミッションの変更
sudo chown root:root /opt/bitnami/nginx/conf/bitnami/certs/server*
sudo chmod 600 /opt/bitnami/nginx/conf/bitnami/certs/server*

# ディレクトリ構成の変更により、こちらは不用（の想定）
# sudo ln -sf /opt/bitnami/letsencrypt/certificates/two-cats-hc-mm.com.key /opt/bitnami/apps/mattermost/conf/certs/server.key
# sudo ln -sf /opt/bitnami/letsencrypt/certificates/two-cats-hc-mm.com.crt /opt/bitnami/apps/mattermost/conf/certs/server.crt

