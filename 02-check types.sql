SELECT co unt(*) as types_created
FROM pg_catalog.pg_type
WHERE typname LIKE '%kids%';