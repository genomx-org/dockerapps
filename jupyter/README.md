Build container:

    docker build \
        --tag unam-uime-jupyter:scipy-notebook \
        --build-arg genomx=`getent group genomx | cut -d: -f3` \
        ./jupyter-notebook/
    
## Duda con NB USER y todo eso
Run container ya bien:
    docker run --detach \
        -p 8888:8888 \
        --user root \
        -e NB_USER="my-username" \
        -e CHOWN_HOME=yes \
        -w "/home/${NB_USER}" \
        --name jupy-scipynotebook-6_5_2\
        --env "VIRTUAL_HOST=jupyter.genomx.be" \
        --env "LETSENCRYPT_HOST=jupyter.genomx.be" \
        --volume "/Data/A/dockerapps/bio-r:/Data:ro" \
        --volume "/home/:/home/" \
        unam-uime-bior:bioconductor 
