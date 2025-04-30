--dsb_templates_query100_083_2b288cfb-a0a3-33aa-8ee2-266ab622036a.sql
--{"gen": "erase", "time": 3.013370990753174, "template": "query100_083", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 55 AND 69 AND s2.ss_list_price BETWEEN 178 AND 192 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 order by cnt