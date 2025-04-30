--dsb_templates_generated-c0d58702-52a4-488d-a095-8d0fc09115d3_cf4234d6-8d9b-3dae-99bb-d4c5c755ad63.sql
--{"gen": "combine", "time": 3.6370534896850586, "template": "generated-c0d58702-52a4-488d-a095-8d0fc09115d3", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
household_demographics AS household_demographics,
inventory AS inventory,
store_sales AS store_sales,
web_sales AS web_sales
WHERE (s1.ss_list_price BETWEEN 26 AND 40 AND s2.ss_list_price BETWEEN 180 AND 194 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 76 AND 96 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND inventory.inv_date_sk = store_sales.ss_sold_date_sk AND inventory.inv_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND inventory.inv_item_sk = web_sales.ws_item_sk AND web_sales.ws_bill_customer_sk = store_sales.ss_customer_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND inventory.inv_quantity_on_hand >= store_sales.ss_quantity)
 order by cnt