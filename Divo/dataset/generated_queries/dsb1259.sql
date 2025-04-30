--dsb_templates_generated-c0d58702-52a4-488d-a095-8d0fc09115d3_eda91669-1b9c-3cdd-be47-876f73612a40.sql
--{"gen": "combine", "time": 2.45039439201355, "template": "generated-c0d58702-52a4-488d-a095-8d0fc09115d3", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2,
item AS item1,
item AS item2
WHERE (customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = 'Primary' AND s1.ss_list_price BETWEEN 19 AND 33 AND s2.ss_list_price BETWEEN 90 AND 104 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 9 AND 28 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND item1.i_item_sk < item2.i_item_sk)
 order by cnt