DROP TABLE IF EXISTS "Passengers";
DROP TABLE IF EXISTS "Airlines";
DROP TABLE IF EXISTS "Flights";
DROP TABLE IF EXISTS "Check_Ins";

CREATE TABLE "Passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    PRIMARY KEY ("id")
);
CREATE TABLE "Airlines" (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT NOT NULL CHECK ("concourse" IN ('A','B','C','D','E','F','T')),
    PRIMARY KEY ("id")
);
CREATE TABLE "Flights" (
    "id" INTEGER,
    "flight_num" INTEGER NOT NULL,
    "airline_id" INTEGER,
    "departing_airport" TEXT,
    "heading_airport" TEXT,
    "dep_datetime" TIMESTAMP,
    "arr_datetime" TIMESTAMP,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "Airlines"("id")
);
CREATE TABLE "Check_Ins" (
    "id" INTEGER,
    "datetime" CURRENT_TIMESTAMP,
    "flight_id" INTEGER,
    "passenger_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("flight_id") REFERENCES "Flights"("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "Passengers"("id")
);
