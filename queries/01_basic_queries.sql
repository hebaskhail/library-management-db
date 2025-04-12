-- =============================================
-- BASIC LIBRARY QUERIES
-- Contains core functions for borrowing/returning
-- =============================================

-- 1. BORROW A BOOK
-- Parameters: user_id, book_id, loan_days 
WITH new_loan AS (
    INSERT INTO loans (user_id, book_id, due_date)
    VALUES (
        1,                          -- User ID 
        3,                          -- Book ID
        NOW() + INTERVAL '14 days'  -- Default 14-day loan
    )
    RETURNING id, book_id
)
UPDATE books
SET available_copies = available_copies - 1
FROM new_loan
WHERE books.id = new_loan.book_id
RETURNING new_loan.id AS loan_id, books.title, books.available_copies;



-- 2. RETURN A BOOK
-- Parameter: loan_id
WITH returned_loan AS (
    UPDATE loans
    SET return_date = NOW(),
        status = 'returned'
    WHERE id = 1  -- Loan ID to return
    RETURNING book_id
)
UPDATE books
SET available_copies = available_copies + 1
FROM returned_loan
WHERE books.id = returned_loan.book_id
RETURNING books.title, books.available_copies;



-- 3. CHECK BOOK AVAILABILITY
SELECT 
    id,
    title,
    author,
    available_copies,
    CASE 
        WHEN available_copies > 0 THEN 'Available'
        ELSE 'Checked Out'
    END AS status
FROM books
WHERE id = 3;  -- Book ID to check



