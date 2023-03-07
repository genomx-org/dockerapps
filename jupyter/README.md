Build container:
    docker build \
        --tag unam-uime-jupyter:jupyter \
        --build-arg genomx=`getent group genomx | cut -d: -f3` \
        ./jupyter/
    
Run container ya bien:
    docker run --detach \
        -p 8888:8888 \
        --user root \
        -e NB_USER="gen" \
        -e CHOWN_HOME=yes \
        -w "/home/${NB_USER}" \
        --name jupyter\
        --env "VIRTUAL_HOST=jupyter.genomx.be" \
        --env "LETSENCRYPT_HOST=jupyter.genomx.be" \
        --volume "/Tools/R/bioconductor_docker/3.16:/usr/local/lib/R/host-site-library" \
        --volume "/Data/A/dockerapps/jupyter:/Data:ro" \
        --volume "/home/:/home/" \
        unam-uime-bior:bioconductor 

Volumes:
    --volume "/Data/A/dockerapps/jupyter:/Data:ro" \
    --volume "/home/:/home/" \
    --volume "/Tools/R/bioconductor_docker/3.16:/usr/local/lib/R/host-site-library" \
