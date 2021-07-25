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

