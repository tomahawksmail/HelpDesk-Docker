

docker build -t helpdesk-image:3.5.1 .
docker network create --driver overlay helpdesk-network
docker tag helpdesk-image:3.5.1 dregistrygui.uskoinc.com/helpdesk-image:3.5.1
docker push dregistrygui.uskoinc.com/helpdesk-image:3.5.1

docker stack deploy -c docker-compose.yml helpdesk_stack --with-registry-auth






docker network create --driver overlay helpdesk-network
docker tag brunoah/hesk dregistrygui.uskoinc.com/brunoah/hesk
docker push dregistrygui.uskoinc.com/brunoah/hesk

docker service create --name helpdesk-service\
                      --with-registry-auth\
                      --replicas 5 \
                      --publish published=9000,target=80,mode=ingress \
                      dregistrygui.uskoinc.com/brunoah/hesk:latest || { echo "Service creation failed"; exit 1; }


docker stack deploy -c docker-compose.yml helpdesk_stack --with-registry-auth