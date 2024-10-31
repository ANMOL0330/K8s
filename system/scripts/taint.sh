# Taint nodes 

NODES=$(kubectl get nodes -o jsonpath='{.items[*].metadata.name}')

for node in $NODES; do
  kubectl taint nodes $node ebs.csi.aws.com/agent-not-ready:NoExecute
done