#!/bin/sh

SERVER_IP=$(curl -s ifconfig.me)

while true; do
  USAGE_DATA=$(free -m | awk 'NR==2 {printf("[~%s MB / %s MB] => [%s MB - 300 MB] ≈ %d MB libres", $3, $2, $7, $7 - 300)}')
  JSON_PAYLOAD="{\"ip\":\"$SERVER_IP\",\"usage\":\"$USAGE_DATA\"}"
  {
    echo -e "HTTP/1.1 200 OK"
    echo -e "Content-Type: application/json; charset=utf-8"
    echo -e "Content-Length: $(echo -n "$JSON_PAYLOAD" | wc -c)"
    echo -e "Connection: close"
    echo -e ""
    echo -e "$JSON_PAYLOAD"
  } | nc -l -p 9999 -q 1
done
