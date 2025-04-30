--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_74060819-b797-317a-a123-cadb28e73f6c.sql
--{"gen": "erase", "time": 2.0971741676330566, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 3687}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 81 AND 100 AND s1.ss_list_price BETWEEN 217 AND 231 AND s2.ss_list_price BETWEEN 196 AND 210 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk)
 group by item2.i_item_sk order by cnt