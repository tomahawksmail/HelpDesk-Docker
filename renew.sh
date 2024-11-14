echo "Download from Git...".............................................................................................
git stash
sleep 1
git pull origin main || { echo "Git pull failed"; exit 1; }
echo "Exporting environment variables..."...............................................................................
export $(grep -v '^#' .env | xargs) || { echo "Failed to export environment variables"; exit 1; }
echo "Adding execution privileges to renew.sh..."..........................................................
chmod +x renew.sh || { echo "Failed to add execution privileges"; exit 1; }
echo "Removing old Docker service..."...................................................................................
docker service rm $(docker service ls --filter "name=helpdesk-image" --format '{{.ID}}') || { echo "Failed to remove old Docker service"; exit 1; }
sleep 1
echo "Deleting old Docker image...".....................................................................................
sleep 2
docker rmi -f $(docker images --quiet --filter "reference=helpdesk-image") || { echo "Failed to delete old image"; exit 1; }
echo "Building new Docker image...".....................................................................................
docker image build -t helpdesk-image:"$VERSION" . || { echo "Image build failed"; exit 1; }
echo "Tagging image for private registry..."............................................................................
docker tag helpdesk-image:"$VERSION" dregistrygui.uskoinc.com/helpdesk-image:"$VERSION" || { echo "Tagging failed"; exit 1; }
echo "Pushing image to private registry...".............................................................................
docker push dregistrygui.uskoinc.com/helpdesk-image:"$VERSION" || { echo "Push to registry failed"; exit 1; }
























docker build -t helpdesk-image:3.5.0 .
docker network create --driver overlay helpdesk-network
docker tag helpdesk-image:latest dregistrygui.uskoinc.com/helpdesk-image:latest || { echo "Tagging failed"; exit 1; }
docker push dregistrygui.uskoinc.com/helpdesk-image:latest || { echo "Push to registry failed"; exit 1; }



dregistrygui.uskoinc.com/helpdesk-image
docker stack deploy -c docker-compose.yml helpdesk_stack --with-registry-auth

