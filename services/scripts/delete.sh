# Delete services

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

# Scheduler service
kubectl delete -n services -f $BASE_PATH/scheduler-service.yml

# Conversation service
kubectl delete -n services -f $BASE_PATH/conversation-service.yml

# Delete Services resources
kubectl delete -n services -f $BASE_PATH/services-sealed-secret.yml
kubectl delete -n services -f $BASE_PATH/services-configmap.yml