# Dockerized Apps

Containerized apps from the Bioinformatics Office at UNAM-UIME.

## nginx-proxy

Create volumes:

    docker volume create certs
    docker volume create vhost
    docker volume create html
    docker volume create acme

Start nginx-proxy:

    docker run --detach \
        --name nginx-proxy-moon \
        --publish 80:80 \
        --publish 443:443 \
        --volume certs:/etc/nginx/certs \
        --volume vhost:/etc/nginx/vhost.d \
        --volume html:/usr/share/nginx/html \
        --volume /var/run/docker.sock:/tmp/docker.sock:ro \
        nginxproxy/nginx-proxy

Start acme companion for issuing SSL certificates:

    docker run --detach \
        --name acme-companion-moon \
        --volumes-from nginx-proxy-moon \
        --volume /var/run/docker.sock:/var/run/docker.sock:ro \
        --volume acme:/etc/acme.sh \
        --env "DEFAULT_EMAIL=gen@genomx.be" \
        nginxproxy/acme-companion