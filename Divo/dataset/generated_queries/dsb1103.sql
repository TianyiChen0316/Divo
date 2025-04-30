--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_36b3e64b-e7d7-391c-80f6-85435857ae72.sql
--{"gen": "combine", "time": 2.4180572032928467, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 71}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 58 AND 77 AND customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = '2 yr Degree' AND s1.ss_list_price BETWEEN 38 AND 52 AND s2.ss_list_price BETWEEN 200 AND 214 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt