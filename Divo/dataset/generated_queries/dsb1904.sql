--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_200ef38d-e69f-3721-89ab-24788f464f3d.sql
--{"gen": "erase", "time": 1.527275562286377, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 513}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item1,
store_sales AS s1
WHERE (item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'Primary' AND s1.ss_list_price BETWEEN 112 AND 126 AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item1.i_item_sk order by cnt