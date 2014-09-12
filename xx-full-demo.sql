DROP TABLE IF EXISTS kids CASCADE;
DROP TABLE IF EXISTS moms CASCADE;

CREATE TABLE kids (
    first_name text
);

INSERT INTO kids VALUES ('First kid');
INSERT INTO kids VALUES ('Second kid');

SELECT * FROM kids;

SELECT count(*) as types_created
FROM pg_catalog.pg_type
WHERE typname LIKE '%kids%';

DROP TABLE IF EXISTS  moms;

CREATE TABLE moms (
  name    text,
  pending kids
);

INSERT INTO moms
VALUES (
  'Mother name',
  (SELECT kids FROM kids LIMIT 1)
);

SELECT * FROM moms;

SELECT (pending).first_name
FROM moms;

DROP TABLE IF EXISTS moms;
CREATE EXTENSION IF NOT EXISTS hstore;

ALTER TABLE kids
  ADD COLUMN appearance hstore
  -- blank default || NULL merge "fun"
  DEFAULT ''::hstore;

UPDATE kids SET
  appearance = 'eyes=>gray,hair=>pink'
WHERE first_name = 'First kid';

UPDATE kids SET
  appearance = appearance || 'fingers=>10';

SELECT * from kids
WHERE
  appearance ? 'hair'   AND
  (appearance -> 'fingers') = '10';


DROP TABLE IF EXISTS  moms;

CREATE TABLE moms (
  name    text,
  bag     json,
  pending kids
);

INSERT INTO moms
VALUES (
  'iMother',
  '{"phone": "iPhone", "lipstick":null,"foo":{"bar":["a","b","c"]}}',
  (SELECT kids FROM kids LIMIT 1 OFFSET 1)
);

SELECT bag->>'phone'
FROM moms
WHERE bag #>>'{foo,bar,2}' = 'c'

SELECT
  array_to_json(
      array_agg(
        row_to_json(moms)
      )
  )
FROM moms

SELECT
  CASE
    WHEN 2 > 1
      THEN 'Truthy'
    ELSE
      'Falsy'
  END as if_example

SELECT *
  FROM generate_series(1,10,3) as for_example

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


SELECT 'back to slides NOW!'
