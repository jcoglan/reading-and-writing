# SQL counter

    ruby exec.rb -e <example> -t[level] -d <database>

## Results

| Example                    | Database   | Isolation        | Result   |
| -------------------------- | ---------- | ---------------- | -------- |
| `unsafe_counter`           | PostgreSQL | -                | failed   |
| `unsafe_counter`           | PostgreSQL | read committed   | failed   |
| `unsafe_counter`           | PostgreSQL | repeatable read  | ok       |
| `unsafe_counter`           | MySQL      | repeatable read  | failed   |
| `unsafe_counter`           | MySQL      | serializable     | deadlock |
| `sql_counter`              | PostgreSQL | -                | ok       |
| `sql_counter`              | MySQL      | -                | ok       |
| `with_lock_counter`        | PostgreSQL | -                | ok       |
| `with_lock_unsafe_counter` | PostgreSQL | -                | failed   |
| `lock_counter`             | PostgreSQL | -                | ok       |
| `lock_counter`             | PostgreSQL | read uncommitted | ok       |
| `lock_counter`             | MySQL      | -                | ok       |
| `lock_counter`             | MySQL      | read uncommitted | ok       |
| `repeatable_read_counter`  | PostgreSQL | -                | ok       |
| `repeatable_read_counter`  | MySQL      | -                | failed   |
| `cas_counter`              | PostgreSQL | -                | ok       |
| `cas_counter`              | MySQL      | -                | ok       |
| `optimistic_counter`       | PostgreSQL | -                | ok       |
| `optimistic_counter`       | MySQL      | -                | ok       |
| `advisory_lock_counter`    | PostgreSQL | -                | ok       |
| `advisory_lock_counter`    | PostgreSQL | read uncommitted | failed   |
