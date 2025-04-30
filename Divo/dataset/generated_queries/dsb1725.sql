--dsb_templates_generated-d7209d33-a5cf-42fb-af5c-8941ebcd04e7_9ee2a863-6365-335d-b63d-b7e6749bb94d.sql
--{"gen": "erase", "time": 3.4567770957946777, "template": "generated-d7209d33-a5cf-42fb-af5c-8941ebcd04e7", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
item AS item1,
store_sales AS s1,
customer_demographics AS customer_demographics
WHERE (date_dim.d_year = 2000 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 191 AND 205 AND customer_demographics.cd_education_status = 'Secondary' AND customer_demographics.cd_marital_status = 'U' AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk)
 LIMIT 100