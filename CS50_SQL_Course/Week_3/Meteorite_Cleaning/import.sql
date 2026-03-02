DROP TABLE IF EXISTS "met_temp";
DROP TABLE IF EXISTS "meteorites";

CREATE TABLE "met_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK ("discovery" IN ("Fell","Found")),
    "year" YEAR,
    "lat" REAL,
    "long" REAL
);

.import --csv --skip 1 meteorites.csv met_temp

DELETE FROM "met_temp"
WHERE "nametype" = 'Relict';

UPDATE "met_temp"
    SET "year" = NULL
    WHERE "year" = '';
UPDATE "met_temp"
    SET "mass" = NULL
    WHERE "mass" = '';
UPDATE "met_temp"
    SET "lat" = NULL
    WHERE "lat" = '';
UPDATE "met_temp"
    SET "long" = NULL
    WHERE "long" = '';

ALTER TABLE "met_temp"
    DROP COLUMN "id";
ALTER TABLE "met_temp"
    DROP COLUMN "nametype";

UPDATE "met_temp"
    SET "mass" = ROUND("mass",2),
    "lat" = ROUND("lat",2),
    "long" = ROUND("long",2);

CREATE TABLE "meteorites" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT CHECK ("discovery" IN ("Fell","Found")),
    "year" YEAR,
    "lat" REAL,
    "long" REAL
);

INSERT INTO "meteorites" (
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
)
SELECT
    "name",
    "class",
    "mass",
    "discovery",
    "year",
    "lat",
    "long"
FROM "met_temp" ORDER BY "year" ASC, "name";

DROP TABLE "met_temp";
