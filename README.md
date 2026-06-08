# Penumbra Backend — Local Setup

## Prerequisites
- Docker (native; do NOT use Docker Desktop on Linux — causes context split-brain)
- JDK 21
- IntelliJ IDEA Community

## Database
PostgreSQL 18 runs in Docker on localhost:5432.
Data persists in the `penumbra_pgdata` named volume.

### Start / stop
    docker compose up -d      # start
    docker compose ps         # verify running
    docker compose down       # stop (keeps data)
    docker compose down -v    # stop AND WIPE data — only when you mean it

### Environment
    Create .env file using .env.example as a template and add actual values.

### Seed from a dump
    docker compose exec -T postgres psql -U postgres -d penumbra < penumbra_full.sql

### Verify
    docker compose exec postgres psql -U postgres -d penumbra -c 'SELECT count(*) FROM book;'
    # expect 358

## App config
`application.properties` reads DB creds from env vars (${DB_*}).
IntelliJ run config must inject `.env` (EnvFile plugin or run-config env vars) —
Spring does NOT read `.env` natively.