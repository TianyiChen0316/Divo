--dsb_templates_generated-19adf05c-0b84-4186-b735-a6af3d6bf7e1_545afa9f-a706-3160-989f-4f82d9c5d940.sql
--{"gen": "erase", "time": 2.760007381439209, "template": "generated-19adf05c-0b84-4186-b735-a6af3d6bf7e1", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (web_sales.ws_wholesale_cost BETWEEN 77 AND 97 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 122 AND 136 AND s2.ss_list_price BETWEEN 279 AND 293 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk)
 order by cnt