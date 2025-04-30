--dsb_templates_query100_083_7e6bf3df-8557-3414-a14a-dab980981eab.sql
--{"gen": "erase", "time": 3.120980739593506, "template": "query100_083", "dataset": "dsb_templates", "rows": 727}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 1999 AND 1999 + 1 AND item2.i_manager_id BETWEEN 11 AND 30 AND customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = 'Primary' AND s1.ss_list_price BETWEEN 50 AND 64 AND s2.ss_list_price BETWEEN 43 AND 57 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item2.i_item_sk order by cnt