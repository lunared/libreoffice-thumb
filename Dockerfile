FROM ubuntu:16.04
MAINTAINER Nicholas Hydock "nhydock@gmail.com"

RUN apt-get update
RUN apt-get install -y libreoffice inotify-tools imagemagick

WORKDIR /code
ADD watcher.sh watcher.sh

CMD ["sh", "watcher.sh"]