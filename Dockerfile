FROM alpine:3.9

RUN apk add --no-cache \
  openssh \
  git

RUN ssh-keygen -A

RUN adduser -D -s "$(which git-shell)" git \
  && echo git:'*' | chpasswd \
  && mkdir /home/git/.ssh \
  && touch /home/git/.ssh/authorized_keys \
  && chown -R git:git /home/git/.ssh \
  && chmod 700 /home/git/.ssh \
  && chmod 600 /home/git/.ssh/*

COPY .docker/ /

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D", "-e"]
