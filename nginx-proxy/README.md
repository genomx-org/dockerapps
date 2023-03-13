# Dockerized Apps

Containerized apps from the Bioinformatics Office at UNAM-UIME.

## nginx-proxy

Create network:

    docker network create ume-pub

Create volumes:

    docker volume create nginx-proxy_certs
    docker volume create nginx-proxy_vhost
    docker volume create nginx-proxy_html
    docker volume create nginx-proxy_acme

Start nginx-proxy:

    docker run --detach \
        --name nginx-proxy-m3 \
        --publish 80:80 \
        --publish 443:443 \
        --volume nginx-proxy_certs:/etc/nginx/certs \
        --volume nginx-proxy_vhost:/etc/nginx/vhost.d \
        --volume nginx-proxy_html:/usr/share/nginx/html \
        --volume /var/run/docker.sock:/tmp/docker.sock:ro \
        nginxproxy/nginx-proxy

Start acme companion for issuing SSL certificates:

    docker run --detach \
        --name acme-companion-m3 \
        --volumes-from nginx-proxy-m3 \
        --volume /var/run/docker.sock:/var/run/docker.sock:ro \
        --volume nginx-proxy_acme:/etc/acme.sh \
        --env "DEFAULT_EMAIL=gen@genomx.be" \
        nginxproxy/acme-companion
