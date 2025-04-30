--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_d0884a41-3c1e-3d52-b77d-8e739bed8e25.sql
--{"gen": "erase", "time": 2.3046388626098633, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 69}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 10 AND 29 AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = 'Secondary' AND s1.ss_list_price BETWEEN 3 AND 17 AND s2.ss_list_price BETWEEN 197 AND 211 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item2.i_item_sk order by cnt