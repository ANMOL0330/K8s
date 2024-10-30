# Create 'services' namespace if it doesn't exist

if ! kubectl get namespace services &> /dev/null; then
    kubectl create namespace services
fi

# Apply Services resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl apply -n services -f $BASE_PATH/services-sealed-secret.yml
kubectl apply -n services -f $BASE_PATH/services-configmap.yml

# User service
kubectl apply -n services -f $BASE_PATH/user-service.yml

# Interview service
kubectl apply -n services -f $BASE_PATH/interview-service.yml

# Conversation service
kubectl apply -n services -f $BASE_PATH/conversation-service.yml

# Payment service
kubectl apply -n services -f $BASE_PATH/payment-service.yml

# Scheduler service
kubectl apply -n services -f $BASE_PATH/scheduler-service.yml