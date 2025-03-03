FROM nginx:alpine

RUN apk update --no-cache && apk upgrade --no-cache && rm -rf /var/cache/apk/*
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx-config /etc/nginx/conf.d/curl-sh-wipe-my-pc.conf

WORKDIR /app/curl-sh-wipe-my-pc
COPY advanced.sh .
COPY basic.sh .
COPY LICENSE .
COPY README.md .

EXPOSE 22827

CMD ["nginx", "-g", "daemon off;"]