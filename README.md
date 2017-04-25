# libreoffice-thumb

This is a persistent docker service provided with volume mapping as a way to extend applications that need the ability to convert documents into pngs.  A common scenario for this would be generating thumbnail files of documents for a data store.

The name of this project is a little misleading, as libreoffice is used only for the initial conversion of the documents into a pdf, which is then converted to png using imagemagick.  This is done because I found that the quality of documents directly into png using only libreoffice was of poor quality.

## Running 

Simply use docker's volume mapping to mount two volumes to a container.  You'll need an `in`, mapped to `/mnt/in` and an `out`, mapped to '/mnt/out`

To do this with docker run, you can do 

`docker run -d -P -v ./media:/mnt/in -v ./thumbs:/mnt/out`

## Composing

An example file is provided that demonstrates how to use the container with docker-compose and django, showing the thumbnails of documents that have been uploaded into a database.

## SystemD/SysVinit

Since the watcher.sh is just a simple inotify script, it's possible with a very little modification to just use it as a systemd script if you wish to provide a service using already installed applications without the overhead of docker.  In fact, docker never really should be necessary, this is just a docker project for ease of deployment which may help one quickly extend an existing system.