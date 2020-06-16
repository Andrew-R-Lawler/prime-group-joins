[ Base Mode Tasks ]

-- 1. Get all customers and their addresses.
SELECT * FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";

-- 2. Get all orders and their line items (orders, quantity and product).
SELECT * FROM "orders"
JOIN "line_items" ON "orders"."id" = "line_items"."order_id";

-- 3. Which warehouses have cheetos?
SELECT * FROM "warehouse"
JOIN "warehouse_product" on "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" on "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = 5;

-- 4. Which warehouses have diet pepsi?
SELECT * FROM "warehouse"
JOIN "warehouse_product" on "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" on "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = 6;

-- 5. Get the number of orders for each customer.
--  NOTE: It is OK if those without orders are not included in the results.
SELECT "first_name", "last_name", count("customers"."id") FROM "orders"
JOIN "addresses" ON "orders"."address_id" = "addresses"."id"
JOIN "customers" ON "addresses"."customer_id" = "customers"."id"
GROUP BY "customers"."id"

-- 6. How many customers do we have?
SELECT count("id") FROM "customers";

customers = 4

-- 7. How many products do we carry?
SELECT count("id") FROM "products";

products = 7

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."id" = 6;

quantity = 92

[ Stretch Goals ]

-- 9. How much was the total cost for each order?
SELECT "orders"."id", sum("products"."unit_price" * "line_items"."quantity") FROM "products"
JOIN "line_items" ON "products"."id" = "line_items"."product_id"
JOIN "orders" ON "line_items"."order_id" = "orders"."id"
GROUP BY "orders"."id"
ORDER BY "orders"."id" ASC;

-- 10. How much has each customer spent in total?



-- 11. How much has each customer spent in total? 
-- Customers who have spent $0 should still show up in the table.
--  It should say 0, not NULL (research coalesce)