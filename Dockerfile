FROM ubuntu:20.04

RUN apt update && \
    apt upgrade -y && \
    apt install -y postfix

# https://serverfault.com/questions/964860/postfix-not-sending-emails-few-problems-detected
RUN cp /etc/services /etc/host.conf /etc/hosts /etc/localtime /etc/nsswitch.conf /etc/resolv.conf /var/spool/postfix/etc/

RUN sed -i -e's/mydestination/#mydestination/' /etc/postfix/main.cf \
    && echo virtual_alias_domains = YOUR_DOMAIN >> /etc/postfix/main.cf \
    && echo virtual_alias_maps = hash:/etc/postfix/virtual >> /etc/postfix/main.cf

COPY virtual /etc/postfix/virtual
RUN postmap /etc/postfix/virtual

CMD ["postfix", "start-fg"]
