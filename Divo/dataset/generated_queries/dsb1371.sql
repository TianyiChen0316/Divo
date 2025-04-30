--dsb_templates_query100_083_29ad43e5-4117-3a78-a4f7-3eeac8238e24.sql
--{"gen": "erase", "time": 3.0797834396362305, "template": "query100_083", "dataset": "dsb_templates", "rows": 545}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item2.i_manager_id BETWEEN 81 AND 100 AND customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = 'Primary' AND s1.ss_list_price BETWEEN 135 AND 149 AND s2.ss_list_price BETWEEN 12 AND 26 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item2.i_item_sk order by cnt