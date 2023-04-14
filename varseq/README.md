# VARSEQ

## Docker management

To build image from Dockerfile:

    docker build --tag unam-uime-varseq:ubuntu-vnc .

To run with nginx-acme:

    docker run --detach \
        -p 6082:443 \
        --name varseq-on-vnc \
        --env "USER=gen" \
        --env "PASSWORD=$VARSEQ_PASSWORD" \
        --env "VNC_PASSWORD=$VARSEQ_PASSWORD" \
        --env "VIRTUAL_HOST=varseq.genomx.be" \
        --env "LETSENCRYPT_HOST=varseq.genomx.be" \
        --volume /Data/A/dockerapps/SVS:/Data:ro \
        --volume /shared/:/shared \
        --volume /dev/shm:/dev/shm \
        --network ume-pub \
        unam-uime-varseq:ubuntu-vnc
