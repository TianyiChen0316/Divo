--dsb_templates_query101_069_715a4c63-0e7c-3a9d-9860-f1aa623ae1e6.sql
--{"gen": "erase", "time": 4.430523633956909, "template": "query101_069", "dataset": "dsb_templates", "rows": 168}
SELECT count(*) AS cnt,
customer.c_customer_sk,
customer.c_first_name,
customer.c_last_name
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (item.i_category IN ('Books', 'Electronics', 'Sports') AND customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND d1.d_year = 1998 AND household_demographics.hd_income_band_sk BETWEEN 0 AND 6 AND household_demographics.hd_buy_potential = '>10000' AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 group by customer.c_customer_sk, customer.c_first_name, customer.c_last_name order by cnt