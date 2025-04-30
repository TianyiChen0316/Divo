--dsb_templates_query102_042_1d5f0eb7-f328-31e5-9f97-c52f8356f577.sql
--{"gen": "erase", "time": 1.6633667945861816, "template": "query102_042", "dataset": "dsb_templates", "rows": 2}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS d2,
inventory AS inventory,
store_sales AS store_sales,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 72 AND 92 AND web_sales.ws_item_sk = store_sales.ss_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_item_sk = store_sales.ss_item_sk AND inventory.inv_date_sk = store_sales.ss_sold_date_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND inventory.inv_quantity_on_hand >= store_sales.ss_quantity)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status order by cnt