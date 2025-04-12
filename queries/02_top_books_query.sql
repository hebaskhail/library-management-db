-- Top 5 most borrowed books in last 6 months
SELECT 
    b.id,
    b.title,
    b.author,
    l.borrow_count
FROM books b
JOIN (
    SELECT 
        book_id, 
        COUNT(*) AS borrow_count
    FROM loans
    WHERE loan_date >= NOW() - INTERVAL '6 months'
    GROUP BY book_id
    ORDER BY borrow_count DESC
    LIMIT 5
) l ON b.id = l.book_id
ORDER BY l.borrow_count DESC;