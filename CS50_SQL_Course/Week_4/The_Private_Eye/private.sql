DROP TABLE IF EXISTS "note";
CREATE TABLE "note" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "sentence_num" INTEGER,
    "phrase_num" INTEGER,
    "lenght" INTEGER
);

INSERT INTO "note" ("sentence_num", "phrase_num", "lenght")
Values
(14,98,4), (114,3,5), (618,72,9), (630,7,3), (932,12,5), (2230,50,7), (2346,44,10), (3041,14,5);

DROP VIEW IF EXISTS "temp";
CREATE VIEW "temp" AS
SELECT DISTINCT("sentences"."id"), "sentence" FROM "sentences"
JOIN "note" ON "sentences"."id" IN (SELECT "sentence_num" FROM "note");

DROP VIEW IF EXISTS "message";
CREATE VIEW "message" AS
SELECT substr("sentence","note"."phrase_num", "lenght") AS "phrase" FROM "temp"
JOIN "note" ON "temp"."id" IN (SELECT "sentence_num" FROM "note")
WHERE "temp"."id" = "note"."sentence_num";



