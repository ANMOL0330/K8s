# Delete postgres resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl delete -n postgres -f $BASE_PATH/postgres-statefulset.yml
kubectl delete -n postgres -f $BASE_PATH/postgres-configmap.yml
kubectl delete -n postgres -f $BASE_PATH/postgres-sealed-secret.yml

kubectl delete -n postgres -f $BASE_PATH/pgadmin-deployment.yml
kubectl delete -n postgres -f $BASE_PATH/pgadmin-sealed-secret.yml