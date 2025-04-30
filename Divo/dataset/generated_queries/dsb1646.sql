--dsb_templates_query019_088_b417c952-4ab0-387d-a59b-61b6f2b37803.sql
--{"gen": "erase", "time": 1.5588412284851074, "template": "query019_088", "dataset": "dsb_templates", "rows": 41}
SELECT item.i_brand AS brand,
item.i_brand_id AS brand_id,
item.i_manufact,
item.i_manufact_id,
sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (item.i_category = 'Music' AND customer_address.ca_state = 'MT' AND customer.c_birth_month = 4 AND store_sales.ss_wholesale_cost BETWEEN 28 AND 48 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_store_sk = store.s_store_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 group by item.i_brand, item.i_brand_id, item.i_manufact, item.i_manufact_id order by ext_price desc, item.i_brand, item.i_brand_id, item.i_manufact_id, item.i_manufact LIMIT 100