--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_ca1b6b0c-2bde-3379-bb54-4ec56a190784.sql
--{"gen": "erase", "time": 2.29337477684021, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 81}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'College' AND s1.ss_list_price BETWEEN 261 AND 275 AND s2.ss_list_price BETWEEN 43 AND 57 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item1.i_item_sk order by cnt