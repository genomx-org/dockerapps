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
        --volume /Data/A/dockerapps/SVS:/Data:ro \
        --volume /Pools/dockerapps/SVS/home/:/home/svs \
        --volume /dev/shm:/dev/shm \
        --volume $PWD/ssl:/etc/nginx/ssl \
        unam-uime-svs:ubuntu-vnc

To run with nginx-acme:

    docker run --detach \
        -p 6081:443 \
        --name svs-on-vnc \
        --env "USER=gen" \
        --env "PASSWORD=$SVS_PASSWORD" \
        --env "VNC_PASSWORD=$SVS_PASSWORD" \
        --env "VIRTUAL_HOST=svs.genomx.be" \
        --env "LETSENCRYPT_HOST=svs.genomx.be" \
        --volume /Data/A/dockerapps/SVS:/Data:ro \
        --volume /shared/:/shared \
        --volume /dev/shm:/dev/shm \
        --network ume-pub \
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

    server {
        listen 443 ssl;
        server_name svs.genomx.be;
        ssl_certificate ssl/nginx.crt;
        ssl_certificate_key ssl/nginx.key;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
        ssl_prefer_server_ciphers on;
    }

restart

    /etc/init.d/nginx restart
