# SVS

## Docker management

To build image from Dockerfile:

    docker build --tag unam-uime-svs:ubuntu-vnc ./SVS

To run:

    docker run --detach \
        -p 6081:443 \
        --name svs-on-vnc \
        --env "SSL_PORT=443" \
        --env "USER=gen" \
        --env "PASSWORD=$SVS_PASSWORD" \
        --env "VNC_PASSWORD=$SVS_PASSWORD" \
        --env  RESOLUTION=1920x1080 \
        --volume /Data/A/dockerapps/SVS:/Data:ro \
        --volume /Pools/dockerapps/SVS/home/:/home/svs \
        --volume /dev/shm:/dev/shm \
        --volume ssl:/etc/nginx/ssl \
        unam-uime-svs:ubuntu-vnc

## TO-DO

Run:

    sudo groupadd -g 1003 genomx
    sudo usermod -a -G genomx gen
    sudo chgrp genomx /home/svs
    sudo chmod 2777 -R /home/svs
    sudo apt-get update
    sudo apt-get install htop

edit nginx config file at `/etc/nginx/sites-enabled/default` and restart:

    /etc/init.d/nginx restart