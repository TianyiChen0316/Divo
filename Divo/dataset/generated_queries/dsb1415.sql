--dsb_templates_query100_083_34baaa22-4ad0-3b3d-8d4d-0f838403570a.sql
--{"gen": "erase", "time": 2.3495066165924072, "template": "query100_083", "dataset": "dsb_templates", "rows": 37}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = 'Secondary' AND s1.ss_list_price BETWEEN 18 AND 32 AND s2.ss_list_price BETWEEN 249 AND 263 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item1.i_item_sk order by cnt