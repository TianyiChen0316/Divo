--dsb_templates_generated-724f5ec2-63d5-4243-b847-0cccff4cf9c0_99ed1bef-c1b2-33bf-a483-401ec081f0d8.sql
--{"gen": "erase", "time": 1.515315294265747, "template": "generated-724f5ec2-63d5-4243-b847-0cccff4cf9c0", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (date_dim.d_year = 1998 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 76 AND 96 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk)
 LIMIT 100