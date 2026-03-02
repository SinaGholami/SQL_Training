SELECT "username"
FROM "users"
JOIN "messages" ON "messages"."to_user_id" = "users"."id"
GROUP BY "to_user_id"
ORDER BY COUNT("messages"."to_user_id") DESC
LIMIT 1;

