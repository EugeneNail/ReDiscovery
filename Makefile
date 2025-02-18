reup: down up

up:
	@docker compose -f ./docker/docker-compose.yaml up -d

down:
	@docker compose -f ./docker/docker-compose.yaml down

build:
	@docker compose -f ./docker/docker-compose.yaml build

shell:
	@docker exec -it rc_$(word 2, $(MAKECMDGOALS)) /bin/bash

log:
	@docker logs --follow rc_$(word 2, $(MAKECMDGOALS))
