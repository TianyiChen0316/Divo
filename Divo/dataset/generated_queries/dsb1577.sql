--dsb_templates_generated-1543267f-d6e0-476f-9c84-c5417010bada_60c63b03-721d-3604-939a-0c3f36022fa3.sql
--{"gen": "combine", "time": 3.9496498107910156, "template": "generated-1543267f-d6e0-476f-9c84-c5417010bada", "dataset": "dsb_templates", "rows": 1}
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
customer_demographics AS customer_demographics,
item AS item2,
store_sales AS s2
WHERE (date_dim.d_year = 2002 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 107 AND 121 AND customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_marital_status = 'D' AND item2.i_manager_id BETWEEN 44 AND 63 AND s2.ss_list_price BETWEEN 28 AND 42 AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND item1.i_item_sk < item2.i_item_sk)
 LIMIT 100