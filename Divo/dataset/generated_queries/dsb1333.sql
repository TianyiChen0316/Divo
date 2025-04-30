--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_1d7ad780-966f-389a-9fb2-8ac67e25a9cd.sql
--{"gen": "erase", "time": 1.5057237148284912, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 1350}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item1,
store_sales AS s1
WHERE (item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = 'Primary' AND s1.ss_list_price BETWEEN 136 AND 150 AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item1.i_item_sk order by cnt