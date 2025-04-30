--dsb_templates_generated-c37b821d-df09-4eb0-98ef-90f2006fa43c_54e76a1e-d426-3ef4-a8f5-63361f6e3cf6.sql
--{"gen": "erase", "time": 0.23534178733825684, "template": "generated-c37b821d-df09-4eb0-98ef-90f2006fa43c", "dataset": "dsb_templates", "rows": 100}
SELECT *
FROM date_dim AS d1,
store_sales AS store_sales,
customer AS customer,
household_demographics AS household_demographics,
date_dim AS date_dim,
item AS item
WHERE (date_dim.d_moy = 8 AND date_dim.d_year = 1999 AND item.i_category = 'Sports' AND store_sales.ss_sold_date_sk = d1.d_date_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk)
 LIMIT 100