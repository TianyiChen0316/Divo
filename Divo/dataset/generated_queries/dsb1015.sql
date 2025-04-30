--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_0052b025-70f4-3061-ab5f-ea7dc4f3a7fc.sql
--{"gen": "erase", "time": 2.389986753463745, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 1248}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 19 AND 38 AND s1.ss_list_price BETWEEN 18 AND 32 AND s2.ss_list_price BETWEEN 3 AND 17 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt