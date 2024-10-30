# Delete services

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

# User service
kubectl delete -n services -f $BASE_PATH/user-service.yaml

# Interview service
kubectl delete -n services -f $BASE_PATH/interview-service.yaml

# Conversation service
kubectl delete -n services -f $BASE_PATH/conversation-service.yaml

# Payment service
kubectl delete -n services -f $BASE_PATH/payment-service.yaml

# Scheduler service
kubectl delete -n services -f $BASE_PATH/scheduler-service.yaml

# Delete Services resources
kubectl delete -n services -f $BASE_PATH/services-sealed-secret.yaml
kubectl delete -n services -f $BASE_PATH/services-configmap.yaml