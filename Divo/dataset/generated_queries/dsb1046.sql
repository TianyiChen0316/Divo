--dsb_templates_generated-27d00c6c-e3cd-4032-88c4-23005060d0d8_1613609a-0cc9-33d5-9ec4-284333e8c71b.sql
--{"gen": "erase", "time": 3.813676357269287, "template": "generated-27d00c6c-e3cd-4032-88c4-23005060d0d8", "dataset": "dsb_templates", "rows": 1}
SELECT avg(store_sales.ss_coupon_amt) AS agg3,
avg(store_sales.ss_list_price) AS agg2,
avg(store_sales.ss_quantity) AS agg1,
avg(store_sales.ss_sales_price) AS agg4,
item.i_item_id
FROM date_dim AS date_dim,
item AS item,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
customer AS customer,
customer_address AS customer_address,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year = 1999 AND item.i_category = 'Books' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 9 AND 28 AND s1.ss_list_price BETWEEN 182 AND 196 AND s2.ss_list_price BETWEEN 243 AND 257 AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100