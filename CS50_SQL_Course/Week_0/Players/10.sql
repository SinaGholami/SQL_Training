SELECT "first_name","last_name", "height" AS "Tallest Players after 2000" FROM "players" WHERE "birth_year" >= '2000'
ORDER BY "height" DESC,"first_name","last_name" LIMIT 20;
