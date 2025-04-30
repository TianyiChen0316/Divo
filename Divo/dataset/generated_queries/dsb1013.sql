--dsb_templates_query100_083_ae2551a1-c041-39ba-b54b-92a9abe2ce88.sql
--{"gen": "erase", "time": 2.3245928287506104, "template": "query100_083", "dataset": "dsb_templates", "rows": 34}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_demographics AS customer_demographics,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 36 AND 55 AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'Advanced Degree' AND s1.ss_list_price BETWEEN 55 AND 69 AND s2.ss_list_price BETWEEN 203 AND 217 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt