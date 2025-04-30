--dsb_templates_generated-40439e44-0d33-4afa-bf88-1686972c126d_e1616342-8ef2-360c-8730-d2e26c0c1ba3.sql
--{"gen": "erase", "time": 2.309446096420288, "template": "generated-40439e44-0d33-4afa-bf88-1686972c126d", "dataset": "dsb_templates", "rows": 6626}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 11 AND 30 AND s1.ss_list_price BETWEEN 73 AND 87 AND s2.ss_list_price BETWEEN 236 AND 250 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk)
 group by item2.i_item_sk order by cnt