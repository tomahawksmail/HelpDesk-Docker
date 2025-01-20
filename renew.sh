export DOCKER_DEFAULT_PLATFORM=linux/amd64
#docker network create --driver overlay helpdesk-network
docker image build -t helpdesk:3.5.2 .
docker tag helpdesk:3.5.2 dregistrygui.uskoinc.com/helpdesk:3.5.2
docker push dregistrygui.uskoinc.com/helpdesk:3.5.2

docker service create --name helpdesk-service\
                      --with-registry-auth\
                      --replicas 4 \
                      --network hesk-net \
                      --mount type=bind,source=/mnt/nfs/shared/helpdesk/app,target=/var/www/html \
                      --publish published=5545,target=80 \
                      dregistrygui.uskoinc.com/helpdesk:3.5.2 || { echo "Service creation failed"; exit 1; }

# docker builder prune

docker stack deploy -c docker-compose.yml helpdesk_stack --with-registry-auth
