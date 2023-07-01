COMPOSE_FILE=docker-compose.yaml

all:
	docker volume create mysql
	docker volume create wordpress
	docker network rm docker-network
	docker network create docker-network
	docker compose -f $(COMPOSE_FILE) down -v
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

stop:
	docker compose -f $(COMPOSE_FILE) stop

fclean:
	docker image rm --force `docker image ls -qa`
	docker volume rm mysql
	docker volume rm wordpress

re: fclean all
