--dsb_templates_query100_083_fc3cb212-5eec-33ee-9ba5-ba78c38a946e.sql
--{"gen": "erase", "time": 3.440575361251831, "template": "query100_083", "dataset": "dsb_templates", "rows": 52}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item2.i_manager_id BETWEEN 73 AND 92 AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'Secondary' AND s1.ss_list_price BETWEEN 69 AND 83 AND s2.ss_list_price BETWEEN 196 AND 210 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item2.i_item_sk order by cnt