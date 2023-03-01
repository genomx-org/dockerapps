# Run bioconductor_docker

Prepare:

    mkdir -p /Tools/R/bioconductor_docker/3.16
    $BIOR_DEFAULT_PW=strong_password

Build container:

    docker build \
        --tag unam-uime-bior:bioconductor \
        --build-arg genomx=`getent group genomx | cut -d: -f3` \
        ./bioconductor/

Run docker container:

    docker run --detach \
        -p 8787:8787 \
        --name bio-r-3_16 \
        --env "PASSWORD=$BIOR_DEFAULT_PW" \
        --env "VIRTUAL_HOST=bio-r.genomx.be" \
        --env "LETSENCRYPT_HOST=bio-r.genomx.be" \
        --volume "/Tools/R/bioconductor_docker/3.16:/usr/local/lib/R/host-site-library" \
        --volume "/Data/A/dockerapps/bio-r:/Data:ro" \
        --volume "/home/:/home/" \
        unam-uime-bior:bioconductor