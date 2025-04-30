--dsb_templates_generated-6e75e605-52cf-4d54-8536-15a45885d5eb_35fdbf21-c3f8-34ff-84bf-a5c0c35407ca.sql
--{"gen": "erase", "time": 2.146681785583496, "template": "generated-6e75e605-52cf-4d54-8536-15a45885d5eb", "dataset": "dsb_templates", "rows": 8258}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 69 AND 88 AND s1.ss_list_price BETWEEN 196 AND 210 AND s2.ss_list_price BETWEEN 196 AND 210 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk)
 group by item2.i_item_sk order by cnt