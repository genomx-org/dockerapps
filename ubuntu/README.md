Build container:

    docker build \
        --tag unam-uime_ubuntu:22.04 \
        --build-arg genomx=`getent group genomx | cut -d: -f3` \
        .
        
Run container:
     docker run --detach \
        --name ubuntu_22.04 \
        --volume "/home/:/home/" \
        unam-uime_ubuntu:22.04



        
