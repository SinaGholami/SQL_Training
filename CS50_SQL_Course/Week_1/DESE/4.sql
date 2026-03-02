SELECT "city",COUNT("name") AS 'Number of Public Schools'
FROM "schools"
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY COUNT("name") DESC, "city"
LIMIT 10;
