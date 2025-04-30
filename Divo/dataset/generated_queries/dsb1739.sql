--dsb_templates_generated-40439e44-0d33-4afa-bf88-1686972c126d_d776e36f-45b1-3341-b487-a01b970ec5e9.sql
--{"gen": "combine", "time": 2.259103775024414, "template": "generated-40439e44-0d33-4afa-bf88-1686972c126d", "dataset": "dsb_templates", "rows": 287}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
household_demographics AS household_demographics,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 18 AND 37 AND s1.ss_list_price BETWEEN 258 AND 272 AND s2.ss_list_price BETWEEN 180 AND 194 AND web_sales.ws_wholesale_cost BETWEEN 33 AND 53 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt