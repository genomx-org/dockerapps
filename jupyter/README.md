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
        -e NB_GID="1101" \
        -e CHOWN_HOME=yes \
        -w "/home/${NB_USER}" \
        --name jupyter\
        --env "VIRTUAL_HOST=jupyter.genomx.be" \
        --env "LETSENCRYPT_HOST=jupyter.genomx.be" \
        --volume "/ruta_de_conda_dir_de_nuestro_lado/:/opt/conda
        --volume "/Data/A/dockerapps/jupyter:/Data:ro" \
        --volume "/home/:/home/" \
        unam-uime-jupyter:jupyter 
