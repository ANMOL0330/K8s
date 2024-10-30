# Delete services

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

# User service
kubectl delete -n services -f $BASE_PATH/user-service.yml

# Interview service
kubectl delete -n services -f $BASE_PATH/interview-service.yml

# Conversation service
kubectl delete -n services -f $BASE_PATH/conversation-service.yml

# Payment service
kubectl delete -n services -f $BASE_PATH/payment-service.yml

# Scheduler service
kubectl delete -n services -f $BASE_PATH/scheduler-service.yml

# Delete Services resources
kubectl delete -n services -f $BASE_PATH/services-sealed-secret.yml
kubectl delete -n services -f $BASE_PATH/services-configmap.yml