--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_5b1a9740-1ea7-33a0-86d4-e7b561874508.sql
--{"gen": "erase", "time": 2.3382914066314697, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 97}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 55 AND 74 AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = 'Secondary' AND s1.ss_list_price BETWEEN 50 AND 64 AND s2.ss_list_price BETWEEN 252 AND 266 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item2.i_item_sk order by cnt