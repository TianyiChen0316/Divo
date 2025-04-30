--dsb_templates_generated-dcd17804-6847-4279-a6c1-1457ad8228bb_82b48965-4807-34dd-adea-1c5d4a7e8527.sql
--{"gen": "combine", "time": 1.9268884658813477, "template": "generated-dcd17804-6847-4279-a6c1-1457ad8228bb", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
item AS item1,
store_sales AS s1,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
date_dim AS d1,
date_dim AS d2,
inventory AS inventory,
item AS item,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 36 AND 50 AND customer_address.ca_city = 'Enterprise' AND d1.d_year = 2000 AND item.i_category IN ('Electronics', 'Jewelry', 'Women') AND item.i_manager_id IN (3, 7, 8, 19, 28, 32, 42, 53, 55, 92) AND web_sales.ws_wholesale_cost BETWEEN 72 AND 92 AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store.s_state = warehouse.w_state AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND item.i_item_sk = inventory.inv_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND inventory.inv_item_sk = web_sales.ws_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_date_sk = d1.d_date_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 group by item1.i_item_sk order by cnt