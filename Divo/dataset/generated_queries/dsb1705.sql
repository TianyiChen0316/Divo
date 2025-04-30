--dsb_templates_query100_083_20f1d20a-8a56-3762-8d02-38f31eedcef2.sql
--{"gen": "erase", "time": 2.045356035232544, "template": "query100_083", "dataset": "dsb_templates", "rows": 15}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 1998 AND 1998 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = '2 yr Degree' AND s1.ss_list_price BETWEEN 191 AND 205 AND s2.ss_list_price BETWEEN 280 AND 294 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item1.i_item_sk order by cnt