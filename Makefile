COMPOSE_FILE=docker-compose.yaml

all:
	mkdir -p /home/dghonyan/data/wordpress
	mkdir -p /home/dghonyan/data/mysql
	docker compose -f $(COMPOSE_FILE) down
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

stop:
	docker compose -f $(COMPOSE_FILE) stop

clean:
	docker compose -f $(COMPOSE_FILE) down -v
	sudo rm -rf /home/dghonyan/data/wordpress
	sudo rm -rf /home/dghonyan/data/mysql

fclean: clean
	-docker kill --force `docker ps -qa`
	-docker image rm --force `docker image ls -qa`
	-docker system prune --force --all

re: fclean all
