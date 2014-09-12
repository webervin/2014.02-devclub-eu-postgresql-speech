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
