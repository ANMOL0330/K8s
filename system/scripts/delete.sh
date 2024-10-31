# Delete system resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

# Sealed Secrets resources

kubectl delete -f $BASE_PATH/sealed-secrets-controller.yaml

KEYS_PATH="$(dirname "$DIR")/sealed-secrets-keys"

for key in $KEYS_PATH/*.key; do
  kubectl delete -f $key
done