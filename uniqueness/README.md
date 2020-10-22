# Uniqnuess constraints

    ruby exec.rb -e <example> -t[level] -d <database>

## Results

| Example                  | Database   | Isolation       | Result                    |
| ------------------------ | ---------- | --------------- | ------------------------- |
| `find_or_create`         | PostgreSQL | -               | failed                    |
| `find_or_create`         | PostgreSQL | read committed  | failed                    |
| `find_or_create`         | MySQL      | -               | failed                    |
| `find_or_create`         | MySQL      | repeatable read | failed                    |
| `lock`                   | PostgreSQL | read committed  | failed                    |
| `lock`                   | MySQL      | repeatable read | deadlock                  |
| `record_not_unique`      | PostgreSQL | -               | ok                        |
| `record_not_unique`      | PostgreSQL | read committed  | tx aborted                |
| `record_not_unique`      | MySQL      | -               | ok                        |
| `record_not_unique`      | MySQL      | repeatable read | deadlock                  |
| `rnu_partial`            | PostgreSQL | -               | ok                        |
| `rnu_partial`            | PostgreSQL | read committed  | tx aborted                |
| `rnu_partial`            | MySQL      | -               | ok                        |
| `rnu_partial`            | MySQL      | repeatable read | `from_name` returns `nil` |
| `rnu_savepoints`         | PostgreSQL | read committed  | ok                        |
| `rnu_savepoints`         | MySQL      | repeatable read | ok                        |
| `rnu_partial_savepoints` | PostgreSQL | read committed  | ok                        |
| `rnu_partial_savepoints` | MySQL      | repeatable read | ok                        |
| `create_or_find`         | PostgreSQL | -               | ok                        |
| `create_or_find`         | PostgreSQL | read committed  | ok                        |
| `create_or_find`         | MySQL      | -               | ok                        |
| `create_or_find`         | MySQL      | repeatable read | ok                        |
| `upsert`                 | PostgreSQL | -               | ok                        |
| `upsert`                 | PostgreSQL | read committed  | ok                        |
| `upsert`                 | MySQL      | -               | ok                        |
| `upsert`                 | MySQL      | repeatable read | ok                        |
| `serializable`           | PostgreSQL | serializable    | ok                        |
| `serializable`           | MySQL      | serializable    | timeout                   |
