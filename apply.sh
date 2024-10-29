# Apply all application resources

BASE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# System resources
bash $BASE_PATH/system/scripts/apply.sh

if [ $? -ne 0 ]; then
  exit 1
fi

# Postgres resources
# Postgres HOSTNAME: postgres-0.postgres.postgres.svc.cluster.local
# Postgres PORT: 5432
bash $BASE_PATH/postgres/scripts/apply.sh

# RabbitMQ resources
# RabbitMQ HOSTNAME: rabbitmq-0.rabbitmq.rabbits.svc.cluster.local
# RabbitMQ PORT: 5672
# RabbitMQ MANAGEMENT PORT: 15672
bash $BASE_PATH/rabbits/scripts/apply.sh

# Redis resources
# Redis HOSTNAME: redis-0.redis.redis.svc.cluster.local
# Redis PORT: 6379
bash $BASE_PATH/redis/scripts/apply.sh

# Services resources
bash $BASE_PATH/services/scripts/apply.sh