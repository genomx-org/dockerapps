# Run bioconductor_docker

Prepare:

    BIOR_DEFAULT_PW=strong_password
    docker volume create bio-r_site-library_3_16

Build container:

    docker build \
        --tag unam-uime_bio-r:3_16 \
        --build-arg genomx=`getent group genomx | cut -d: -f3` \
        .

Run docker container:

    docker run --detach \
        -p 8787:8787 \
        -h "genomx.be" \
        --name bio-r-3_16 \
        --env "PASSWORD=$BIOR_DEFAULT_PW" \
        --env "VIRTUAL_HOST=bio-r.genomx.be" \
        --env "LETSENCRYPT_HOST=bio-r.genomx.be" \
        --volume "bio-r_site-library_3_16:/usr/local/lib/R/host-site-library" \
        --volume "/Data/A/dockerapps/bio-r:/Data:ro" \
        --volume "/home/:/home/" \
        unam-uime_bio-r:3_16
