# Port forward postgres pgadmin
kubectl port-forward -n postgres svc/pgadmin-service 8000:80