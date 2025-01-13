setup: install db-migrate

install:
	npm install

db-migrate:
	npm run migrate

build:
	npm run build

prepare-env:
	cp -n .env.example .env

start:
	docker-compose up app

ci:
    docker-compose -f docker-compose.yml up -d app-production
    docker-compose -f docker-compose.yml exec app-production make test
    docker-compose -f docker-compose.yml down

dev:
	npx concurrently "make start-frontend" "make start-backend"

start-backend:
	npm start -- --watch --verbose-watch --ignore-watch='node_modules .git .sqlite'

start-frontend:
	npx webpack --watch --progress

lint:
	npx eslint .

lint-fix:
	npx eslint --fix .

test:
	docker-compose up app-production
