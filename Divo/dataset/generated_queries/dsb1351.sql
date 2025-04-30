--dsb_templates_query100_083_fb46ceb5-95c1-345b-b9e6-08b2b7fd86d3.sql
--{"gen": "combine", "time": 3.0194079875946045, "template": "query100_083", "dataset": "dsb_templates", "rows": 7}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 6 AND 25 AND s1.ss_list_price BETWEEN 178 AND 192 AND s2.ss_list_price BETWEEN 16 AND 30 AND d1.d_year = 1998 AND household_demographics.hd_buy_potential = '5001-10000' AND household_demographics.hd_income_band_sk BETWEEN 6 AND 12 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_returns.sr_returned_date_sk = d1.d_date_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 group by item1.i_item_sk, item2.i_item_sk order by cnt