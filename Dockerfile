# a comment
FROM ubuntu:14.04
MAINTAINER test
RUN echo deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse  > /etc/apt/sources.list
RUN echo deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse  >> /etc/apt/sources.list
RUN echo deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse  >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN echo "[supervisord]" >> /etc/supervisor/conf.d/supervisord.conf
RUN echo "nodaemon=true" >> /etc/supervisor/conf.d/supervisord.conf
RUN echo "[program:sshd]" >> /etc/supervisor/conf.d/supervisord.conf
RUN echo "command=/usr/sbin/sshd -D" >> /etc/supervisor/conf.d/supervisord.conf
RUN echo "[program:apache2]" >> /etc/supervisor/conf.d/supervisord.conf
RUN echo 'command=/bin/bash -c "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"' >> /etc/supervisor/conf.d/supervisord.conf
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
123546545345353
453453453453


