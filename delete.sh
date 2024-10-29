# Delete all application resources

BASE_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Postgres resources
bash $BASE_PATH/postgres/scripts/delete.sh

# RabbitMQ resources
bash $BASE_PATH/rabbits/scripts/delete.sh

# Redis resources
bash $BASE_PATH/redis/scripts/delete.sh

# Services resources
bash $BASE_PATH/services/scripts/delete.sh

# Gateway resources
bash $BASE_PATH/gateway/scripts/delete.sh

# System resources
bash $BASE_PATH/system/scripts/delete.sh