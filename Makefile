setup:
	docker compose run --rm app make setup

build:
	npm run build

prepare-env:
	cp -n .env.example .env

start:
	docker-compose up

ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app
#	docker-compose -f docker-compose.yml up -d app-production
#	docker-compose -f docker-compose.yml exec app-production make test
#	docker-compose -f docker-compose.yml down

test:
	docker-compose up app-production
