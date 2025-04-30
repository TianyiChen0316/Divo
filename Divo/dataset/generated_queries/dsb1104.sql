--dsb_templates_generated-81b59279-65b9-4ec6-971a-cb14c18357c5_c5cdcf4e-eb02-35b1-bf98-987b9872892c.sql
--{"gen": "erase", "time": 3.406156539916992, "template": "generated-81b59279-65b9-4ec6-971a-cb14c18357c5", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4
FROM date_dim AS date_dim,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
item AS item1,
store_sales AS s1
WHERE (date_dim.d_year = 2000 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 98 AND 112 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk)
 LIMIT 100