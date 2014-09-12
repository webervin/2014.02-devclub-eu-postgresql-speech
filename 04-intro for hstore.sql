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

