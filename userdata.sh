#!/bin/bash
# Bootstrap the web tier: a tiny page that confirms the instance is up and
# reports which database host it is wired to. Replace with your real app.
set -euo pipefail

dnf -y update
dnf -y install httpd mariadb105

TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 60")
AZ=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" \
  http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/index.html <<HTML
<!doctype html>
<html>
  <head><title>Two-tier app</title></head>
  <body style="font-family: system-ui; max-width: 40rem; margin: 4rem auto;">
    <h1>Web tier is live</h1>
    <p>Availability zone: <code>$AZ</code></p>
    <p>Database host: <code>${db_host}</code></p>
    <p>Database name: <code>${db_name}</code></p>
    <p>DB user: <code>${db_username}</code></p>
    <p>This instance reaches RDS over the private network only.</p>
  </body>
</html>
HTML

systemctl enable --now httpd
