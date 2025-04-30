--dsb_templates_generated-6e75e605-52cf-4d54-8536-15a45885d5eb_5e7bb204-0894-31b0-bf4b-c4bfef13f073.sql
--{"gen": "erase", "time": 2.3067755699157715, "template": "generated-6e75e605-52cf-4d54-8536-15a45885d5eb", "dataset": "dsb_templates", "rows": 7903}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 43 AND 62 AND s1.ss_list_price BETWEEN 165 AND 179 AND s2.ss_list_price BETWEEN 72 AND 86 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk)
 group by item2.i_item_sk order by cnt