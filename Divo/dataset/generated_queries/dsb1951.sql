--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_171b00a1-4b30-30f2-aaa6-0484402d2e64.sql
--{"gen": "erase", "time": 2.25472092628479, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 517}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 78 AND 97 AND s1.ss_list_price BETWEEN 146 AND 160 AND s2.ss_list_price BETWEEN 212 AND 226 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt