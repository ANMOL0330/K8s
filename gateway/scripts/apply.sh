# Create 'gateway' namespace if it doesn't exist

if ! kubectl get namespace gateway &> /dev/null; then
    kubectl create namespace gateway
fi

# Apply Gateway resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl apply -n gateway -f $BASE_PATH/services-bridges.yaml
kubectl apply -n gateway -f $BASE_PATH/services-ingress.yaml