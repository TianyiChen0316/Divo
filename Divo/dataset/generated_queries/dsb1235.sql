--dsb_templates_generated-43c2e303-c8d8-43f4-abc1-0bf41554ee4a_db1ead96-bfb4-3585-9dbf-b29d15b745ee.sql
--{"gen": "erase", "time": 2.2749249935150146, "template": "generated-43c2e303-c8d8-43f4-abc1-0bf41554ee4a", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (item.i_category = 'Men' AND store.s_state = 'MT' AND d2.d_moy = 8 AND d2.d_year = 2002 AND customer.c_birth_month = 11 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 69 AND 83 AND s2.ss_list_price BETWEEN 96 AND 110 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = store_sales.ss_customer_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100