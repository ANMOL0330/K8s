# Delete rabbitmq resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl delete -n rabbits -f $BASE_PATH/rabbit-statefulset.yml
kubectl delete -n rabbits -f $BASE_PATH/rabbit-sealed-secret.yml
kubectl delete -n rabbits -f $BASE_PATH/rabbit-configmap.yml
kubectl delete -n rabbits -f $BASE_PATH/rabbit-rbac.yml