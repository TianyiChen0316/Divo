--dsb_templates_generated-ac2d4ca1-d5eb-464e-8625-a4ace9a7a6dc_7adf0cf2-af43-3659-b746-acaab5fa8a2d.sql
--{"gen": "erase", "time": 0.501274585723877, "template": "generated-ac2d4ca1-d5eb-464e-8625-a4ace9a7a6dc", "dataset": "dsb_templates", "rows": 2}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM date_dim AS date_dim,
item AS item,
store_sales AS store_sales,
store_returns AS store_returns,
catalog_sales AS catalog_sales,
customer AS customer,
call_center AS call_center
WHERE (date_dim.d_year = 2001 AND item.i_category = 'Jewelry' AND customer.c_birth_month = 4 AND call_center.cc_class = 'medium' AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100