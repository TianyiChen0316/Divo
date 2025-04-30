--dsb_templates_query102_042_bd660439-844b-3765-90da-dfae5e3886de.sql
--{"gen": "erase", "time": 1.7779338359832764, "template": "query102_042", "dataset": "dsb_templates", "rows": 6}
SELECT count(*) AS cnt,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d2,
household_demographics AS household_demographics,
store AS store,
store_sales AS store_sales,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 5 AND 25 AND web_sales.ws_item_sk = store_sales.ss_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk)
 group by household_demographics.hd_vehicle_count order by cnt