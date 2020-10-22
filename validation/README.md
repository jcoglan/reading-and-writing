# Write skew and partial validity

    ruby exec.rb -e <example> -t[level] -d <database>

## Results

| Example      | Database   | Isolation       | Result   |
| ------------ | ---------- | --------------- | ------   |
| `partial`    | PostgreSQL | -               | failed   |
| `partial`    | PostgreSQL | read committed  | failed   |
| `partial`    | PostgreSQL | repeatable read | ok       |
| `partial`    | PostgreSQL | serializable    | ok       |
| `partial`    | MySQL      | -               | failed   |
| `partial`    | MySQL      | read committed  | failed   |
| `partial`    | MySQL      | repeatable read | failed   |
| `partial`    | MySQL      | serializable    | deadlock |
| `optimistic` | PostgreSQL | -               | ok       |
| `optimistic` | PostgreSQL | read committed  | ok       |
| `optimistic` | PostgreSQL | repeatable read | ok       |
| `optimistic` | PostgreSQL | serializable    | ok       |
| `optimistic` | MySQL      | -               | ok       |
| `optimistic` | MySQL      | read committed  | ok       |
| `optimistic` | MySQL      | repeatable read | ok       |
| `optimistic` | MySQL      | serializable    | deadlock |
