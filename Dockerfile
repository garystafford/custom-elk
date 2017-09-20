# http://elk-docker.readthedocs.io/

FROM sebp/elk:551

LABEL MAINTAINER "Gary A. Stafford <gary.stafford@accenture.com>"
ENV REFRESHED_AT 2017-09-13

# overwrite existing logstash config file
ADD 30-output.conf /etc/logstash/conf.d/30-output.conf
ADD 02-beats-input.conf /etc/logstash/conf.d/02-beats-input.conf

# install elasticsearch plugins
# install curator to remove old data in elasticsearch
RUN echo 'deb [arch=amd64] http://packages.elastic.co/curator/5/debian stable main' >> /etc/apt/sources.list \
  && apt-get update -y && apt-get upgrade -y \
  && apt-get install wget -y \
  && wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add - \
  && apt-get install elasticsearch-curator -y --allow-unauthenticated

WORKDIR /tmp