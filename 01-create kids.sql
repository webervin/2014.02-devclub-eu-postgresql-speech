DROP TABLE IF EXISTS kids CASCADE;

CREATE TABLE kids (
    first_name text
);

INSERT INTO kids VALUES ('First kid');
INSERT INTO kids VALUES ('Second kid');

SELECT * FROM kids;
