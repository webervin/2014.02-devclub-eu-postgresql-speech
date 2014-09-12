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