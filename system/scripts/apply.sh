# Apply system resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

# Sealed Secrets resources

KEYS_PATH="$(dirname "$DIR")/sealed-secrets-keys"
KEYS_COUNT=$(ls -1 $KEYS_PATH/*.key 2>/dev/null | wc -l)

if [ $KEYS_COUNT -eq 0 ]; then
  echo "No sealed-secrets keys found. Add keys to $KEYS_PATH and try again."
  exit 1
fi

for key in $KEYS_PATH/*.key; do
  kubectl apply -f $key
done

kubectl apply -f $BASE_PATH/sealed-secrets-controller.yaml

# Wait for Sealed Secrets controller to be available
kubectl wait --for=condition=available --timeout=300s deployment/sealed-secrets-controller -n kube-system

# Apply aws secret
kubectl apply -f $BASE_PATH/aws-sealed-secret.yaml

# Apply aws ebs csi driver
kubectl apply -k $BASE_PATH/aws-ebs-csi-driver

# Apply storage class
kubectl apply -f $BASE_PATH/aws-ebs-storage-class.yaml