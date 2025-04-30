--dsb_templates_query100_083_c71e7852-c2d6-3c17-850d-fa78195b44e6.sql
--{"gen": "erase", "time": 2.4566524028778076, "template": "query100_083", "dataset": "dsb_templates", "rows": 55}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 1998 AND 1998 + 1 AND item2.i_manager_id BETWEEN 18 AND 37 AND customer_demographics.cd_marital_status = 'M' AND customer_demographics.cd_education_status = '4 yr Degree' AND s1.ss_list_price BETWEEN 203 AND 217 AND s2.ss_list_price BETWEEN 79 AND 93 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item2.i_item_sk order by cnt