setup:
	docker compose run --rm app make setup

prepare-env:
	cp -n .env.example .env

start:
	docker-compose up

ci:
	docker compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

test:
	docker-compose up app-production
