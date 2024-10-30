# Create 'postgres' namespace if it doesn't exist

if ! kubectl get namespace postgres &> /dev/null; then
    kubectl create namespace postgres
fi

# Apply Postgres resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

kubectl apply -n postgres -f $BASE_PATH/postgres-sealed-secret.yaml
kubectl apply -n postgres -f $BASE_PATH/postgres-configmap.yaml
kubectl apply -n postgres -f $BASE_PATH/postgres-statefulset.yaml

# Wait for Postgres to be ready
kubectl wait --for=condition=ready pod -l app=postgres -n postgres --timeout=300s

# Apply PgAdmin resources
kubectl apply -n postgres -f $BASE_PATH/pgadmin-sealed-secret.yaml
kubectl apply -n postgres -f $BASE_PATH/pgadmin-deployment.yaml