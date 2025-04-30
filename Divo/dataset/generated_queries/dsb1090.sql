--dsb_templates_generated-40439e44-0d33-4afa-bf88-1686972c126d_1defd130-f60a-30aa-8a11-6c7f3f73909b.sql
--{"gen": "combine", "time": 2.2214412689208984, "template": "generated-40439e44-0d33-4afa-bf88-1686972c126d", "dataset": "dsb_templates", "rows": 356}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 24 AND 43 AND s1.ss_list_price BETWEEN 286 AND 300 AND s2.ss_list_price BETWEEN 93 AND 107 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt