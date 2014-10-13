FROM ubuntu:latest

RUN apt-get update && apt-get -y install git python-pip python-dev python-setuptools supervisor

WORKDIR /
RUN git clone https://github.com/foosel/octoprint.git

WORKDIR /octoprint
RUN git checkout devel && python setup.py install

RUN mkdir -p /root/.octoprint/

ADD scripts/config.yaml /root/.octoprint/config.yaml
ADD scripts/users.yaml /root/.octoprint/users.yaml
ADD scripts/octoprint.conf /etc/supervisor/conf.d/octoprint.conf
ADD scripts/start.sh /start.sh

RUN chmod +x /start.sh
RUN chmod +x /octoprint/run

EXPOSE 5000
VOLUME /storage

WORKDIR /

CMD ["/start.sh"]
