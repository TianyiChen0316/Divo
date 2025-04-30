--dsb_templates_generated-27d00c6c-e3cd-4032-88c4-23005060d0d8_d586c0ac-2bde-3f92-b423-bb193c66ed0d.sql
--{"gen": "erase", "time": 3.2778213024139404, "template": "generated-27d00c6c-e3cd-4032-88c4-23005060d0d8", "dataset": "dsb_templates", "rows": 1}
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
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year = 2002 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 55 AND 69 AND s2.ss_list_price BETWEEN 176 AND 190 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk)
 LIMIT 100