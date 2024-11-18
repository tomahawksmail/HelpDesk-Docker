




docker build -t helpdesk-image:3.5.0 .
docker network create --driver overlay helpdesk-network
docker tag helpdesk-image:3.5.0 dregistrygui.uskoinc.com/helpdesk-image:3.5.0
docker push dregistrygui.uskoinc.com/helpdesk-image:3.5.0



dregistrygui.uskoinc.com/helpdesk-image
docker stack deploy -c docker-compose.yml helpdesk_stack --with-registry-auth

