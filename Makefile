setup:
	@make build
	@make up
build:
	docker-compose build --no-cache --force-rm
up:
	docker-compose up -d
stop:
    docker-compose stop
composer-update:
	docker exec laravel_docker bash -c "composer update"
