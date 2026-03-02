SELECT "english_title","japanese_title","entropy" AS 'Hokusai Least Entropy' FROM "views" WHERE "artist" = 'Hokusai' ORDER BY "entropy" LIMIT 5;
