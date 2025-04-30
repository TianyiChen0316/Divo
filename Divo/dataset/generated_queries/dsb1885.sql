--dsb_templates_generated-3f9da75d-a69c-47c4-a176-1c13f5e028a6_a5787780-0741-3233-adf1-e375046ca22e.sql
--{"gen": "combine", "time": 0.7648212909698486, "template": "generated-3f9da75d-a69c-47c4-a176-1c13f5e028a6", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
grouping(store.s_state) AS g_state,
item.i_item_id,
store.s_state
FROM date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
customer AS customer,
item AS item1,
store_sales AS s1,
catalog_sales AS catalog_sales,
date_dim AS d2,
date_dim AS d3
WHERE (date_dim.d_year = 1998 AND item.i_category = 'Women' AND store.s_state = 'WV' AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 146 AND 160 AND d2.d_moy BETWEEN 9 AND 9 + 2 AND d2.d_year = 2000 AND d3.d_moy BETWEEN 6 AND 6 + 2 AND d3.d_year = 2000 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk)
 group by rollup(item.i_item_id, store.s_state) order by item.i_item_id, store.s_state LIMIT 100