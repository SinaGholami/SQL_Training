DROP TABLE IF EXISTS "Ingeredients";
DROP TABLE IF EXISTS "Donuts";
DROP TABLE IF EXISTS "Donuts_Ingeredients";
DROP TABLE IF EXISTS "Orders";
DROP TABLE IF EXISTS "Customers";
DROP TABLE IF EXISTS "Order_Items";

CREATE TABLE "Ingeredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "unit" TEXT,
    "ppu" NUMERIC,
    PRIMARY KEY ("id")
);

CREATE TABLE "Donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "gluten_free" TEXT NOT NULL,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Donuts_Ingeredients" (
    "donut_id" INTEGER NOT NULL,
    "ingeredient_id" INTEGER NOT NULL,
    "amount" NUMERIC,
    "unit" TEXT,
    PRIMARY KEY ("donut_id", "ingeredient_id"),
    FOREIGN KEY ("donut_id") REFERENCES "Donuts"("id"),
    FOREIGN KEY ("ingeredient_id") REFERENCES "Ingeredients"("id")
);

CREATE TABLE "Orders" (
    "id" INTEGER,
    "number" INTEGER NOT NULL UNIQUE,
    "customer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("customer_id") REFERENCES "Customers"("id")
);

CREATE TABLE "Customers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "history" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Order_Items" (
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    PRIMARY KEY ("order_id", "donut_id")
    FOREIGN KEY ("order_id") REFERENCES "Orders"("id"),
    FOREIGN KEY ("donut_id") REFERENCES "Donuts"("id")
);
