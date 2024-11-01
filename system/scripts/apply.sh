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

# Wait for Sealed Secrets controller to be ready
kubectl wait --for=condition=available --timeout=600s deployment/sealed-secrets-controller -n kube-system

# Apply aws-sealed-secret
kubectl apply -f $BASE_PATH/aws-sealed-secret.yaml

# Taint nodes
NODES=$(kubectl get nodes -o jsonpath='{.items[*].metadata.name}')

for node in $NODES; do
  kubectl taint nodes $node ebs.csi.aws.com/agent-not-ready:NoExecute
done

# Apply aws-ebs-csi-driver resources
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.36"

# Wait for aws-ebs-csi-driver to be ready
kubectl wait --for=condition=available --timeout=600s deployment/aws-ebs-csi-controller -n kube-system

# Apply storage class
kubectl apply -f $BASE_PATH/aws-ebs-storage-class.yaml