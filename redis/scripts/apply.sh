# Create 'redis' namespace if it doesn't exist

if ! kubectl get namespace redis &> /dev/null; then
    kubectl create namespace redis
fi

# Apply Redis resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl apply -n redis -f $BASE_PATH/redis-sealed-secret.yaml
kubectl apply -n redis -f $BASE_PATH/redis-configmap.yaml
kubectl apply -n redis -f $BASE_PATH/redis-statefulset.yaml

# Wait till all Redis pods are running
kubectl wait -n redis --for=condition=Ready pod/redis-0 --timeout=300s
kubectl wait -n redis --for=condition=Ready pod/redis-1 --timeout=300s
kubectl wait -n redis --for=condition=Ready pod/redis-2 --timeout=300s

# Apply Sentinel resources
kubectl apply -n redis -f $BASE_PATH/sentinel-statefulset.yaml

# Apply RedisInsight resources
kubectl apply -n redis -f $BASE_PATH/redisinsight-deployment.yaml