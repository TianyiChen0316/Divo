--dsb_templates_generated-507578a5-4734-4078-9491-21c071e72369_3430d6dc-5766-34a9-bfb1-d0d36f310d91.sql
--{"gen": "combine", "time": 1.8265972137451172, "template": "generated-507578a5-4734-4078-9491-21c071e72369", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
date_dim AS d3,
customer AS customer,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
item AS item
WHERE (date_dim.d_year = 1999 AND d3.d_moy BETWEEN 4 AND 4 + 2 AND d3.d_year = 1999 AND customer.c_birth_month = 4 AND s1.ss_list_price BETWEEN 62 AND 76 AND s2.ss_list_price BETWEEN 178 AND 192 AND customer_address.ca_state = 'AR' AND item.i_category = 'Men' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = catalog_sales.cs_bill_customer_sk)
 LIMIT 100