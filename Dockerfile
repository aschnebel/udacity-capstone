FROM nginx:mainline-alpine

LABEL maintainer="Schnebel, Alexander"

RUN rm -v /etc/nginx/nginx.conf

ADD nginx.conf /etc/nginx/

RUN mkdir /etc/nginx/logs

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY runner.sh /runner.sh
RUN chmod +x /runner.sh

ADD index.html /www/data/

EXPOSE 80

ENTRYPOINT [ "/runner.sh" ]

CMD [ "nginx" ]
