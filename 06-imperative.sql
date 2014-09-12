SELECT
  CASE
    WHEN 2 > 1
      THEN 'Truthy'
    ELSE
      'Falsy'
  END as if_example

SELECT *
  FROM generate_series(1,10,3) as for_example
