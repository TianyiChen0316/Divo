--dsb_templates_query100_083_bebfcd63-889c-3e1a-9b9e-862117617849.sql
--{"gen": "erase", "time": 3.494886636734009, "template": "query100_083", "dataset": "dsb_templates", "rows": 107}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = 'College' AND s1.ss_list_price BETWEEN 23 AND 37 AND s2.ss_list_price BETWEEN 143 AND 157 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item1.i_item_sk order by cnt