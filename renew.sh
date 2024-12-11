
#docker network create --driver overlay helpdesk-network
docker image build -t helpdesk .
docker tag helpdesk:latest dregistrygui.uskoinc.com/helpdesk:3.5.1
docker push dregistrygui.uskoinc.com/helpdesk:3.5.1
#docker push dregistrygui.uskoinc.com/brunoah/hesk
#
docker service create --name helpdesk-service\
                      --with-registry-auth\
                      --replicas 1 \
                      --publish published=5544,target=80 \
                      dregistrygui.uskoinc.com/helpdesk:3.5.1 || { echo "Service creation failed"; exit 1; }


docker stack deploy -c docker-compose.yml helpdesk_stack --with-registry-auth
