COMPOSE_FILE=docker-compose.yaml

all:
	docker volume create mysql
	docker volume create wordpress
	docker network create docker-network
	docker compose -f $(COMPOSE_FILE) down -v
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

stop:
	docker compose -f $(COMPOSE_FILE) stop

clean:
	docker compose -f $(COMPOSE_FILE) down -v
	docker volume rm mysql
	docker volume rm wordpress
	docker network rm docker-network

fclean: clean
	docker compose -f $(COMPOSE_FILE) down -v
	docker image rm `docker image ls -qa`

re: fclean all