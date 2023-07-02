COMPOSE_FILE=docker-compose.yaml

all:
	docker volume create mysql
	docker volume create wordpress
	docker compose -f $(COMPOSE_FILE) down
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

stop:
	docker compose -f $(COMPOSE_FILE) stop

clean:
	docker compose -f $(COMPOSE_FILE) down 
	docker volume rm mysql
	docker volume rm wordpress

fclean: clean
	-docker container prune -f
	-docker image rm --force `docker image ls -qa`

re: fclean all
