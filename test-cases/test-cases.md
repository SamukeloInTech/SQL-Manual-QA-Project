# Manual Test Cases - E-Commerce Database

| Test ID | Test Scenario | SQL Verification | Expected Result | Status |
| :--- | :--- | :--- | :--- | :--- |
| **TC-01** | Verify inactive users remain in the database but are flagged | `SELECT * FROM users WHERE is_active = FALSE;` | Returns 1 row (Carol). Proves boolean saved correctly. | **PASS** |
| **TC-02** | Verify Order Total matches the sum of Order Items | See `database/math_check.sql` | The `total_price` and `calculated_total` must match perfectly. | **PASS** |
| **TC-03** | Verify system blocks ordering out-of-stock items | See `bug-reports/BUG-001.md` | 0 rows returned. System should block order. | **FAIL** (See Bug 001) |
