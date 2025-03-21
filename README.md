# Simple Bank API

A simple banking system API built with Go and PostgreSQL, using sqlc for database query generation.

## Features

- Account management
  - Create, read, update, and delete accounts
  - List accounts with pagination
- Entry management
  - Create and retrieve account entries
  - List entries for a specific account
- Transfer management
  - Create and retrieve transfers between accounts
  - List transfers involving specific accounts

## Technologies

- **Go** - Programming language
- **PostgreSQL** - Database
- **sqlc** - SQL query compiler
- **pgx** - PostgreSQL driver and toolkit for Go
- **Docker** - Containerization

## Prerequisites

- Go 1.23.7 or higher
- Docker
- PostgreSQL 16

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/eminel9311/simplebank.git
   cd simplebank
   ```

2. Start PostgreSQL container:
   ```bash
   make postgres
   ```

3. Create database:
   ```bash
   make createdb
   ```

4. Run migrations:
   ```bash
   make migrateup
   ```

5. Generate SQL code:
   ```bash
   make sqlc
   ```

## Database Schema

The database consists of three main tables:

1. **accounts**
   - id (primary key)
   - owner
   - balance
   - currency
   - created_at

2. **entries**
   - id (primary key)
   - account_id (foreign key to accounts)
   - amount
   - created_at

3. **transfers**
   - id (primary key)
   - from_account_id (foreign key to accounts)
   - to_account_id (foreign key to accounts)
   - amount
   - created_at

## API Endpoints

### Accounts
- `POST /accounts` - Create new account
- `GET /accounts/:id` - Get account details
- `PUT /accounts/:id` - Update account
- `DELETE /accounts/:id` - Delete account
- `GET /accounts` - List accounts

### Entries
- `POST /entries` - Create new entry
- `GET /entries/:id` - Get entry details
- `GET /entries` - List entries for account

### Transfers
- `POST /transfers` - Create new transfer
- `GET /transfers/:id` - Get transfer details
- `GET /transfers` - List transfers involving account

## Development

### Running Tests
```bash
go test ./...
```

### Stopping Database
```bash
make postgres-stop
```

### Removing Database Container
```bash
make postgres-remove
```

### Dropping Database
```bash
make dropdb
```

## License

MIT License

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Author

Eminel9311 