SELECT "players"."first_name", "players"."last_name" FROM "players"
WHERE "players"."id" IN (
    SELECT "salaries"."player_id"
    FROM "salaries"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    WHERE "salaries"."year" = "performances"."year" AND "salaries"."year" = '2001' AND "performances"."H" IS NOT NULL
    AND ("salaries"."salary"/"performances"."H") IS NOT NULL
    ORDER BY ("salaries"."salary"/"performances"."H") ASC
    LIMIT 10
)
AND "players"."id" IN (
    SELECT "salaries"."player_id"
    FROM "salaries"
    JOIN "performances" ON "salaries"."player_id" = "performances"."player_id"
    WHERE "salaries"."year" = "performances"."year" AND "salaries"."year" = '2001' AND "performances"."RBI" IS NOT NULL
    AND ("salaries"."salary"/"performances"."RBI") IS NOT NULL
    ORDER BY ("salaries"."salary"/"performances"."RBI") ASC
    LIMIT 10
)
ORDER BY "players"."id";
