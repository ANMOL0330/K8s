# Create 'rabbits' namespace if it doesn't exist

if ! kubectl get namespace rabbits &> /dev/null; then
    kubectl create namespace rabbits
fi

# Apply RabbitMQ resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl apply -n rabbits -f $BASE_PATH/rabbit-rbac.yaml
kubectl apply -n rabbits -f $BASE_PATH/rabbit-configmap.yaml
kubectl apply -n rabbits -f $BASE_PATH/rabbit-sealed-secret.yaml
kubectl apply -n rabbits -f $BASE_PATH/rabbit-statefulset.yaml

# Wait for RabbitMQ to be ready
kubectl wait --for=condition=ready pod -l app=rabbitmq -n rabbits --timeout=300s