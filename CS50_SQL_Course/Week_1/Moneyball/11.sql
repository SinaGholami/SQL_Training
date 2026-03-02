SELECT "players"."first_name", "players"."last_name", ("salaries"."salary"/"performances"."H") AS "dollars per hit"
FROM "players"
JOIN "salaries" ON "salaries"."player_id" = "players"."id"
JOIN "performances" ON "performances"."player_id" = "players"."id"
WHERE "performances"."year" = '2001' AND "salaries"."year" = '2001' AND "performances"."H" IS NOT NULL AND "dollars per hit" IS NOT NULL
ORDER BY "dollars per hit", "first_name", "last_name"
LIMIT 10;
