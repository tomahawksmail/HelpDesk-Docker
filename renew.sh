
docker network create --driver overlay helpdesk-network
docker tag brunoah/hesk dregistrygui.uskoinc.com/brunoah/hesk
docker push dregistrygui.uskoinc.com/brunoah/hesk

docker service create --name helpdesk-service\
                      --with-registry-auth\
                      --replicas 5 \
                      --publish published=5544,target=80 \
                      dregistrygui.uskoinc.com/brunoah/hesk:latest || { echo "Service creation failed"; exit 1; }


