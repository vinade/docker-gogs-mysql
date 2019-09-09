#!/bin/sh

GOGS_HOST="${GOGS_HTTP_DOMAIN}:${GOGS_HOST_PORT}"

curl --insecure -i -X POST \
 --url "http://${GOGS_HOST}/install" \
 -H "Host: ${GOGS_HOST}" \
 -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:54.0) Gecko/20100101 Firefox/54.0" \
 -H "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8" \
 -H "Accept-Language: fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3" --compressed \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -H "Cookie: lang=fr-FR; _csrf=Gy0F9bRDHu7ZcpHujAIemQwbxOk6MTUwMTkyNDk5MDczNDA3MDgyNw%3D%3D; i_like_gogits=43b227f39f056bc6" \
 -H "Connection: keep-alive" \
 -H "Upgrade-Insecure-Requests: 1" \
 --data "db_type=MySQL" \
 --data "db_host=${MYSQL_HOST}:${MYSQL_PORT}" \
 --data "db_user=${MYSQL_ROOT_USER}" \
 --data "db_passwd=${MYSQL_ROOT_PASSWORD}" \
 --data "db_name=${MYSQL_DATABASE}" \
 --data "ssl_mode=disable" \
 --data "db_path=data/gogs.db" \
 --data "app_name=${GOGS_APP_NAME}" \
 --data "repo_root_path=/data/git/gogs-repositories" \
 --data "run_user=git" \
 --data "domain=${GOGS_HTTP_DOMAIN}" \
 --data "ssh_port=${GOGS_SSH_PORT}" \
 --data "http_port=3000" \
 --data "app_url=http://${HOST}" \
 --data "log_root_path=/app/gogs/log" \
 --data "use_builtin_ssh_server=${GOGS_BUILTIN_SSH_SERVER}" \
 --data "enable_federated_avatar=on" \
 --data "enable_captcha=on" \
 --data "enable_console_mode=${GOGS_ENABLE_CONSOLE_MODE}" \
 --data "admin_name=${GOGS_ADMIN_NAME}" \
 --data "admin_passwd=${GOGS_ADMIN_PASSWD}" \
 --data "admin_confirm_passwd=${GOGS_ADMIN_PASSWD}" \
 --data "admin_email=${GOGS_ADMIN_EMAIL}"