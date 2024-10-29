# Port forward rabbitmq management console
kubectl port-forward -n rabbits svc/rabbitmq 8002:15672