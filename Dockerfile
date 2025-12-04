FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx-config /etc/nginx/conf.d/curl-sh-wipe-my-pc.conf

WORKDIR /app/curl-sh-wipe-my-pc
COPY advanced.sh .
COPY basic.sh .
COPY LICENSE .
COPY README.md .

EXPOSE 22827

CMD ["nginx", "-g", "daemon off;"]