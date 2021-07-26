# install docker
apt-get update;

apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y;

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update; apt-get install docker-ce docker-ce-cli containerd.io -y;

# create docker swarm
docker swarm init --advertise-addr 10.124.0.2 --listen-addr 0.0.0.0:2377 --force-new-cluster

# join docker swarm cluster
docker swarm join --token SWMTKN-1-k378r347yu7fyr3d7dud78dud78 10.124.0.2:2377

# promote node as manager
docker node promote cs2

# docker list nodes
docker node ls

#docker create service
docker service create nginx

#docker publish service
docker service update c5zm156f159g --publish-add 80:80

#docker update service with replica
docker service update c5zm156f159g --replicas 3

#docker create service with volume 
docker service create --name nginx --mount type=bind,source=/home/docker/www,target=/usr/share/nginx/html -p 80:80 nginx

# reference
# https://boxboat.com/2017/08/03/deploy-web-app-docker-swarm-sticky-sessions/
