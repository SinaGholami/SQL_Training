DROP TABLE IF EXISTS "Users";
DROP TABLE IF EXISTS "Schools_Universities";
DROP TABLE IF EXISTS "Companies";
DROP TABLE IF EXISTS "Connections_People";
DROP TABLE IF EXISTS "Connections_School";
DROP TABLE IF EXISTS "Connections_Companies";

CREATE TABLE "Users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);
CREATE TABLE "Schools_Universities" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT,
    "year_founded" INTEGER,
    "location" TEXT,
    PRIMARY KEY ("id")
);
CREATE TABLE "Companies" (
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY ("id")
);
CREATE TABLE "Connections_People" (
    "id" INTEGER,
    "user1_id",
    "user2_id",
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user1_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("user2_id") REFERENCES "Users"("id")
);
CREATE TABLE "Connections_School" (
    "id" INTEGER,
    "user_id",
    "school_id",
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "degree_type" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "Schools_Universities"("id")
);
CREATE TABLE "Connections_Companies" (
    "id" INTEGER,
    "user_id",
    "company_id",
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "title" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "Users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "Companies"("id")
);
