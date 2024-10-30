# Create 'services' namespace if it doesn't exist

if ! kubectl get namespace services &> /dev/null; then
    kubectl create namespace services
fi

# Apply Services resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl apply -n services -f $BASE_PATH/services-sealed-secret.yaml
kubectl apply -n services -f $BASE_PATH/services-configmap.yaml

# User service
kubectl apply -n services -f $BASE_PATH/user-service.yaml

# Interview service
kubectl apply -n services -f $BASE_PATH/interview-service.yaml

# Conversation service
kubectl apply -n services -f $BASE_PATH/conversation-service.yaml

# Payment service
kubectl apply -n services -f $BASE_PATH/payment-service.yaml

# Scheduler service
kubectl apply -n services -f $BASE_PATH/scheduler-service.yaml