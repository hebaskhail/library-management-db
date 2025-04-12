-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone VARCHAR(20) CHECK (phone ~ '^[0-9()+-. ]+$'),
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    isbn TEXT UNIQUE NOT NULL,
    publication_year INTEGER,
    total_copies INTEGER NOT NULL DEFAULT 1 CHECK (total_copies > 0),
    available_copies INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Loans table
CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    book_id INTEGER NOT NULL,
    loan_date TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    due_date TIMESTAMPTZ NOT NULL,
    return_date TIMESTAMPTZ,
    status VARCHAR(10) DEFAULT 'active',
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);