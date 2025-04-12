-- The Tables have these check constraints
ALTER TABLE books ADD CONSTRAINT check_availability 
    CHECK (available_copies <= total_copies AND available_copies >= 0);
    
ALTER TABLE loans ADD CONSTRAINT check_status 
    CHECK (status IN ('active', 'returned', 'overdue'));