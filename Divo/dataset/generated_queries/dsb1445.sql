--dsb_templates_generated-1e87a24e-fb9c-4592-82be-e1818c18c2d0_dd2caee1-8e62-36a8-a3ca-63bd9597f165.sql
--{"gen": "combine", "time": 1.1402802467346191, "template": "generated-1e87a24e-fb9c-4592-82be-e1818c18c2d0", "dataset": "dsb_templates", "rows": 401}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
store_sales AS store_sales,
date_dim AS d1
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND household_demographics.hd_income_band_sk BETWEEN 11 AND 17 AND household_demographics.hd_buy_potential = '1001-5000' AND customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'D' AND date_dim.d_year = 1999 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt