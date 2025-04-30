--dsb_templates_query100_083_8611ce8e-d2e3-3d42-8fb3-78bb366e2b81.sql
--{"gen": "erase", "time": 2.4500997066497803, "template": "query100_083", "dataset": "dsb_templates", "rows": 50}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 6 AND 25 AND customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = '2 yr Degree' AND s1.ss_list_price BETWEEN 107 AND 121 AND s2.ss_list_price BETWEEN 146 AND 160 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt