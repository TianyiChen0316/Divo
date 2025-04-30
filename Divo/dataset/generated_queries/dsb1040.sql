--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_28fb9fb9-2e2d-33e0-a391-3a8bd6445c24.sql
--{"gen": "erase", "time": 2.33746600151062, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 327}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 77 AND 96 AND customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 120 AND 134 AND s2.ss_list_price BETWEEN 176 AND 190 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item2.i_item_sk order by cnt