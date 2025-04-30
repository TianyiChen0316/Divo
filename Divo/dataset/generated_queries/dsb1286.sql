--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_168a6466-dced-3e55-aa7a-12b20c0650fd.sql
--{"gen": "erase", "time": 2.09863018989563, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 3168}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 48 AND 67 AND s1.ss_list_price BETWEEN 259 AND 273 AND s2.ss_list_price BETWEEN 169 AND 183 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk)
 group by item2.i_item_sk order by cnt