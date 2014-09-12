WITH
    name AS (
      SELECT 'junior' as first
  ),
    new_kid as (
    INSERT INTO kids
    VALUES (
      (SELECT first FROM name)
    )
    RETURNING *
  )
SELECT * FROM new_kid;


WITH RECURSIVE t(n) AS (
  VALUES (1)
  UNION ALL
  SELECT n+1 FROM t WHERE n < 5
)
SELECT sum(n) FROM t;