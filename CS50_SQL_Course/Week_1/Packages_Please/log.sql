-- This is the log of packages problem in CS50 SQL! Let's do this!
-- *** The Lost Letter ***
-- let's finds out the id address of senter (Anneke)
SELECT "id","address","type"
FROM "addresses"
WHERE "address" LIKE '900 somerville avenue';
-- which return 432 as the id address, now lets check what packages has this id as from address id
SELECT "id","contents","from_address_id","to_address_id"
FROM "packages"
WHERE "from_address_id" = '432';
-- we have 4 packages, one of them is congratulary letter which is our subject. it's id is 384
-- and its to address id is 854, lets check if that matches varshas address
SELECT "id","address","type"
FROM "addresses"
WHERE "id" = '854';
-- YES! we find her. OK now lets find the driver responsible for the package
SELECT "id","driver_id","package_id","address_id","action","timestamp"
FROM "scans"
WHERE "package_id" = '384';
-- now it shows that the driver picked up and droped off the package we can now answer the question
-- for the last part let's clean every thing in one prompt!
SELECT "id","package_id","address_id","action","timestamp"
FROM "scans"
WHERE "package_id" = (
    SELECT "id"
    FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id"
        FROM "addresses"
        WHERE "address" LIKE '900 Somerville Avenue'
    )
);
-- Done and done!

-- *** The Devious Delivery ***
-- wow so mysterious! OK we have a town name only. lets find addresses with this name
SELECT "id","address","type"
FROM "addresses"
WHERE "address" LIKE '%fiftyville%';
-- nothing! it says there is no from address maybe thats the case literally!
-- I thing checking packages with out a from address could be useful lets try
SELECT "id","contents","from_address_id","to_address_id"
FROM "packages"
WHERE "from_address_id" IS NULL;
-- only one! so i think we found it!
-- id of package is 5098
SELECT "id","driver_id","package_id","address_id","action","timestamp"
FROM "scans"
WHERE "package_id" LIKE '5098';
-- yes it was actually delivered! so lets answer the question.
SELECT "id","type"
FROM "addresses"
WHERE "id" = '50' OR "id" = '348';

-- *** The Forgotten Gift ***
-- OK from address is 728 Maple Place, to address is 109 tileston street. thats all we have
SELECT "id","address","type"
FROM "addresses"
WHERE "address" = '728 Maple Place' OR "address" = '109 Tileston Street';
-- now we know the id addresses of maple place is 4983 and Tileston is 9873
-- let find the package for the next step
SELECT "id","contents","from_address_id","to_address_id"
FROM "packages"
WHERE "from_address_id" = '9873';
-- ok the gift is flowers! now finally lets check the scans to find it. package id is 9523
SELECT "id","driver_id","package_id","address_id","action","timestamp"
FROM "scans"
WHERE "package_id" = '9523';
-- sadly it was delivered to a wrong address but it was picked up again!
-- lets see who has it now
SELECT "id","name"
FROM "drivers"
WHERE "id" = '17';
-- I  hope that mikel delivers the package to its rightful owner ASAP!
