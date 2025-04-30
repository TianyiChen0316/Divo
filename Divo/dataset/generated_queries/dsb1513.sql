--dsb_templates_generated-fcd2fede-04cd-430f-965f-edd9757234ea_4cdde2a4-7a4c-3ce0-a727-71b88f333691.sql
--{"gen": "erase", "time": 0.3152647018432617, "template": "generated-fcd2fede-04cd-430f-965f-edd9757234ea", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM store_sales AS store_sales,
date_dim AS d2,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3,
customer AS customer,
customer_address AS customer_address
WHERE (d2.d_moy = 2 AND d2.d_year = 2000 AND d3.d_moy BETWEEN 1 AND 1 + 2 AND d3.d_year = 2002 AND customer.c_birth_month = 12 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk)
 LIMIT 100