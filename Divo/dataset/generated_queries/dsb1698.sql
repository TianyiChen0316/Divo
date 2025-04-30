--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_42e13aed-dd4f-35f6-a724-26760bd623b6.sql
--{"gen": "combine", "time": 0.9769225120544434, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
store_sales AS s1,
store_sales AS s2,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (s1.ss_list_price BETWEEN 98 AND 112 AND s2.ss_list_price BETWEEN 55 AND 69 AND item.i_category = 'Jewelry' AND store.s_state = 'KS' AND d1.d_year = 2002 AND web_sales.ws_wholesale_cost BETWEEN 71 AND 91 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk)
 order by cnt