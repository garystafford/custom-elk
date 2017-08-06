# https://hub.docker.com/_/nginx/

FROM nginx:1.13.3

LABEL MAINTAINER "Gary A. Stafford <gary.stafford@accenture.com>"
ENV REFRESHED_AT 2017-08-06

COPY bootstrap_nginx.sh bootstrap_nginx.sh
COPY default.conf /etc/nginx/conf.d/default.conf
COPY elk.garystafford-aws.com/fullchain1.pem /etc/ssl/fullchain1.pem
COPY elk.garystafford-aws.com/privkey1.pem /etc/ssl/privkey1.pem

CMD ["nginx", "-g", "daemon off;"]
