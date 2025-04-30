--dsb_templates_query102_042_937cb539-86f4-3dd3-b0fb-075292c2c405.sql
--{"gen": "erase", "time": 3.596196174621582, "template": "query102_042", "dataset": "dsb_templates", "rows": 6}
SELECT count(*) AS cnt,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 2001 AND web_sales.ws_wholesale_cost BETWEEN 77 AND 97 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 group by household_demographics.hd_vehicle_count order by cnt