# If we use a domain name for which there is a HTTPS 65 record at CloudFlare the etc/hosts file is ignored
# So we always use .local for the release
# See: https://stackoverflow.com/questions/65972371/why-does-etc-hosts-not-work-anymore-for-some-websites-on-big-sur
RELEASE_NAME=stock-tickr
TAG="localhost:5001/$RELEASE_NAME:latest"

echo "TAG=$TAG"

docker build -t $TAG .
docker push $TAG

helm upgrade "$RELEASE_NAME" ./k8s/helm --install

DEPLOYMENT="deployment/$RELEASE_NAME-deployment"
echo "DEPLOYMENT=$DEPLOYMENT"
kubectl rollout restart "deployment/$RELEASE_NAME-deployment"