--dsb_templates_generated-ba1b1ba1-5801-49b0-8bb5-5d7fc6733c07_2840cc2a-bfe5-3078-8a57-5f06e56dfa39.sql
--{"gen": "combine", "time": 2.8360273838043213, "template": "generated-ba1b1ba1-5801-49b0-8bb5-5d7fc6733c07", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
item AS item,
store AS store,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
date_dim AS d1,
date_dim AS d2,
date_dim AS d3,
store_returns AS store_returns
WHERE (customer_demographics.cd_marital_status = 'M' AND customer_demographics.cd_education_status = 'College' AND s1.ss_list_price BETWEEN 26 AND 40 AND s2.ss_list_price BETWEEN 15 AND 29 AND customer_address.ca_state = 'OR' AND item.i_category = 'Sports' AND store_sales.ss_wholesale_cost BETWEEN 33 AND 53 AND d1.d_moy = 7 AND d1.d_year = 2002 AND d2.d_moy BETWEEN 4 AND 4 + 2 AND d2.d_year = 2000 AND d3.d_moy BETWEEN 10 AND 10 + 2 AND d3.d_year = 1998 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND d1.d_date_sk = store_sales.ss_sold_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_customer_sk = customer.c_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by cnt