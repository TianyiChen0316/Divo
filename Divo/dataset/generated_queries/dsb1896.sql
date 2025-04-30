--dsb_templates_generated-90994f61-4527-4c45-99e3-34c99bbb3732_4095bd0e-e77e-390d-b303-69faf786dd00.sql
--{"gen": "combine", "time": 3.446270227432251, "template": "generated-90994f61-4527-4c45-99e3-34c99bbb3732", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM item AS item,
store AS store,
store_sales AS store_sales,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (store.s_state = 'FL' AND item.i_category = 'Electronics' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 71 AND 90 AND s1.ss_list_price BETWEEN 249 AND 263 AND s2.ss_list_price BETWEEN 165 AND 179 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100