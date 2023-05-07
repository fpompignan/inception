all:
	@docker-compose -f ./srcs/docker-compose.yml up -d

start:
	@docker-compose -f ./srcs/docker-compose.yml start

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop


down:
	@docker-compose -f ./srcs/docker-compose.yml down

build:
	@docker-compose -f ./srcs/docker-compose.yml build

re: clean
	@docker-compose -f ./srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -a);\
	docker rm $$(docker ps -a);\
	docker rmi -f $$(docker images -a);\
	docker volume rm $$(docker volume ls);\
	docker network rm $$(docker network ls);

.PHONY: all re down clean



