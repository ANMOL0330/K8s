# Delete redis resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl delete -n redis -f $BASE_PATH/redis-statefulset.yml
kubectl delete -n redis -f $BASE_PATH/redis-configmap.yml
kubectl delete -n redis -f $BASE_PATH/redis-sealed-secret.yml

# Delete Sentinel resources

kubectl delete -n redis -f $BASE_PATH/sentinel-statefulset.yml

# Delete RedisInsight resources

kubectl delete -n redis -f $BASE_PATH/redisinsight-deployment.yml