--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_2a46ef13-0832-3d74-945b-6aaae6f76d53.sql
--{"gen": "erase", "time": 2.3419389724731445, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 8011}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 71 AND 90 AND s1.ss_list_price BETWEEN 107 AND 121 AND s2.ss_list_price BETWEEN 191 AND 205 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk)
 group by item2.i_item_sk order by cnt