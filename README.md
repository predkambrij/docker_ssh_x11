# docker_ssh_x11

## Examples  

### Run a graphical APP in a docker container on a remote server via ssh x11 forwarding:  

1. connect to the server via ssh with x11 forwarding enabled:  

```console
ssh -X <remote_server>  
```

2. build and start the docker container with:  
    bash buildenv.sh
    docker-compose build
    docker-compose up

3. You should now be able to run X apps from the docker container and they will be displayed on the client which is connected via ssh.  

Resources:  
http://wangkejie.me/2018/01/08/remote-gui-app-in-docker/  
https://blog.yadutaf.fr/2017/09/10/running-a-graphical-app-in-a-docker-container-on-a-remote-server/  

