# Delete system resources

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_PATH="$(dirname "$DIR")/manifests"

# Sealed Secrets resources

kubectl delete -f $BASE_PATH/sealed-secrets-controller.yaml

KEYS_PATH="$(dirname "$DIR")/sealed-secrets-keys"

for key in $KEYS_PATH/*.key; do
  kubectl delete -f $key
done

# Delete aws secret
kubectl delete -f $BASE_PATH/aws-sealed-secret.yaml

# Delete aws ebs csi driver
kubectl delete -k $BASE_PATH/aws-ebs-csi-driver

# Delete storage class
kubectl delete -f $BASE_PATH/aws-ebs-storage-class.yaml