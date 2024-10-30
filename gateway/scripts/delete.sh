# Delete Gateway resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl delete -n gateway -f $BASE_PATH/services-ingress.yaml
kubectl delete -n gateway -f $BASE_PATH/services-bridges.yaml