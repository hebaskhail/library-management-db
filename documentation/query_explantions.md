# Top Books Query Explanation

## Purpose
Finds the 5 most frequently borrowed books in the last 6 months

## Execution Flow
1. Inner query:
   - Filters loans from last 6 months.
   - Groups by book_id and counts loans.
   - Returns top 5 book IDs with counts.

2. Outer query:
   - Joins with books table to get full details.
   - Preserves the ordering from inner query.

