# Library Management System Database

![Database ER Diagram](documentation/ER_Diagram.png)

A complete PostgreSQL database solution for library management systems.

## Features

- **User Management**: Track library members and their status
- **Book Inventory**: Manage book metadata and availability
- **Loan Tracking**: Record checkouts, returns, and overdue items

## Installation

1. **Prerequisites**:
   - PostgreSQL 12+
   - psql client like pgAdmin


2. **Manual Setup**:
   ```sql
CREATE DATABASE library_management;
\c library_management

-- Execute schema files
\i schema/01_tables.sql
\i schema/02_constraints.sql
\i schema/03_indexes.sql

-- Load seed data
\i data/01_users.sql
\i data/02_books.sql
\i data/03_loans.sql
   ```

## Usage

Run the main query to find top 5 most borrowed books:
```bash
psql library_management -f queries/02_top_books_query.sql
```

## Sample Output

```sql
 book_id |           title           |      author      | borrow_count
---------+---------------------------+------------------+--------------
      42 | The Great Gatsby          | F. Scott Fitzgerald | 12
      17 | 1984                     | George Orwell    | 9
      31 | To Kill a Mockingbird    | Harper Lee       | 7
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Create a new Pull Request

