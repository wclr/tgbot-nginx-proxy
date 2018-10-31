FROM nginx:alpine

COPY ./proxy.conf /etc/nginx/conf.d/default.conf

ENV PROXY_PASS https://api.telegram.org/

CMD sed -i 's@${PROXY_PASS}@'"$PROXY_PASS"'@' /etc/nginx/conf.d/default.conf && nginx -g "daemon off;"
