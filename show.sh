# Port forwards for all services

BASE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Postgres 
bash $BASE_PATH/postgres/scripts/show.sh & \
# RabbitMQ 
bash $BASE_PATH/rabbits/scripts/show.sh & \
# Redis 
bash $BASE_PATH/redis/scripts/show.sh