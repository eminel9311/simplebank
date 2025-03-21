DB_NAME=simple_bank
DB_USER=postgres
DB_PASSWORD=Abc@12345678
DB_CONTAINER=postgres16
CONTAINER_DB_PORT=5432
HOST_PORT=54322


postgres:
	docker run --name $(DB_CONTAINER) -e POSTGRES_USER=$(DB_USER) -e POSTGRES_PASSWORD=$(DB_PASSWORD) -p $(HOST_PORT):$(CONTAINER_DB_PORT) -d postgres:16-alpine

postgres-stop:
	docker stop $(DB_CONTAINER)

postgres-remove:
	docker rm $(DB_CONTAINER)


createdb:
	docker exec -it $(DB_CONTAINER) bash -c "until pg_isready -U $(DB_USER); do sleep 1; done && psql -U $(DB_USER) -c 'CREATE DATABASE $(DB_NAME);'"


dropdb:
	docker exec -it $(DB_CONTAINER) psql -U $(DB_USER) -c "DROP DATABASE $(DB_NAME);"


migrateup:
	migrate -path db/migration -database "postgresql://$(DB_USER):$(DB_PASSWORD)@localhost:$(HOST_PORT)/$(DB_NAME)?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://$(DB_USER):$(DB_PASSWORD)@localhost:$(HOST_PORT)/$(DB_NAME)?sslmode=disable" -verbose down

sqlc:
	sqlc generate


.PHONY: postgres createdb dropdb migrateup migratedown sqlc

