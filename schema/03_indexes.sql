-- Users indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_name ON users(name);

-- Books indexes
CREATE INDEX idx_books_title ON books(title);
CREATE INDEX idx_books_author ON books(author);
CREATE INDEX idx_books_availability ON books(available_copies) WHERE available_copies > 0;

-- Loans indexes
CREATE UNIQUE INDEX idx_loans_active ON loans(user_id, book_id) WHERE status = 'active';
CREATE INDEX idx_loans_user ON loans(user_id);
CREATE INDEX idx_loans_book ON loans(book_id);
CREATE INDEX idx_loans_dates ON loans(loan_date, due_date);
CREATE INDEX idx_loans_status ON loans(status) WHERE status = 'active';
CREATE INDEX idx_loans_book_date_status ON loans(book_id, loan_date, status);