/usage
http
usage_api
9999

if ($uri != "/usage") {
    return 302 /login;
}
if ($arg_pass != "1907") {
    return 302 /login;
}

add_header X-Frame-Options "DENY" always;
add_header X-Content-Type-Options "nosniff" always;
add_header Content-Security-Policy "default-src 'none'" always;
set $cors_origin "";
if ($http_origin ~* "^https?://usage\.brianuceda\.xyz$") {
    set $cors_origin $http_origin;
}
add_header 'Access-Control-Allow-Origin' "$cors_origin" always;
add_header 'Access-Control-Allow-Credentials' 'true' always;
if ($request_method = 'OPTIONS') {
    add_header 'Access-Control-Allow-Methods' 'GET, OPTIONS' always;
    add_header 'Access-Control-Allow-Headers' 'Content-Type' always;
    add_header 'Content-Length' 0;
    return 204;
}