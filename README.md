0_install-docker.sh: is used to install docker, if docker is installed, you may ignore this script

1_create-image.sh: create docker image, before run this script, pls edit two files, this script need to execute once:
    a) inc.sh: make sure you have set the correct PROJECT_NAME, DOCKER_IMAGE_NAME, DOCKER_CONTAINER_NAME
    b) Dockerfile: make sure you have set the correct LABEL, user, user_pass, user_id, group_id

2_crate-container.sh: create dokcer container

start-container.sh: start container, once started successfully, system switch to container linux immediately. if you run "exit", container will stop immediately.

3_destroy-container.sh: is used to destroy docker conatiner created by 2.start-container.sh

4_destroy-image.sh: is used to destroy both docker image/conatiner created by 1.create-image.sh/2.create-container.sh

run-in-container: this folder contains script that should be executed on docker container
----0_env.sh
|   Set runing environment, this script need to be executed once.
|   Setup your git information here
----load-ssh-key.sh: called by 0.env.sh to import ssh-private-key to access git/bitbucket


Note that all above scripts should be executed in sequence, the first digit in file name represents sequence. that is to say:
    //One time execute
    0_install-docker.sh
    1_create-image.sh
    2_create-container.sh

    //Execute each time working
    start-container.sh
     -> Then go to inside the container to use  /run-in-container scripts

    //One time execute
    3_destroy-container.sh
    4_destroy-image.sh
