FROM node
MAINTAINER mark<mark.oliver.schmitt@gmail.com>

RUN apt-get update && apt-get install -y openssh-server && apt-get clean

RUN useradd -m -d /home/jenkins -s /bin/sh jenkins &&\
  echo "jenkins:jenkins" | chpasswd

EXPOSE 22

RUN mkdir /var/run/sshd

CMD ["/usr/sbin/sshd", "-D"]
