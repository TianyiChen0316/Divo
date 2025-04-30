--dsb_templates_generated-bdc71ca1-f494-4aef-a78a-b0586c14f921_44590997-7206-34ea-8894-9e2e7060a413.sql
--{"gen": "erase", "time": 0.7652990818023682, "template": "generated-bdc71ca1-f494-4aef-a78a-b0586c14f921", "dataset": "dsb_templates", "rows": 48}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns
WHERE (customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'M' AND customer_demographics.cd_marital_status = 'W' AND date_dim.d_year = 1999 AND item.i_category = 'Jewelry' AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100