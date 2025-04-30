--dsb_templates_generated-ad6c35c3-e5e8-4660-abe1-6173e3dee112_935ff3c1-c112-376c-9303-d872c9067948.sql
--{"gen": "combine", "time": 2.213876485824585, "template": "generated-ad6c35c3-e5e8-4660-abe1-6173e3dee112", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
item AS item1,
item AS item2,
store_sales AS s2
WHERE (customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 268 AND 282 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 62 AND 81 AND s2.ss_list_price BETWEEN 178 AND 192 AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND item1.i_item_sk < item2.i_item_sk)
 order by cnt