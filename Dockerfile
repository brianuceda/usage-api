FROM alpine:latest
RUN apk add --no-cache curl netcat-openbsd
COPY usage-api.sh /usage-api.sh
RUN chmod +x /usage-api.sh
CMD ["/usage-api.sh"]
