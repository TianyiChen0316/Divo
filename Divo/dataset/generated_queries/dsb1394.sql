--dsb_templates_generated-b0d507fa-8467-478e-8916-ebe03c44b882_33a7f396-2464-312a-a3f3-c1f7aca8d576.sql
--{"gen": "erase", "time": 3.5268895626068115, "template": "generated-b0d507fa-8467-478e-8916-ebe03c44b882", "dataset": "dsb_templates", "rows": 7}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS d1,
date_dim AS d2,
inventory AS inventory,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 2002 AND web_sales.ws_wholesale_cost BETWEEN 9 AND 29 AND date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 39 AND 58 AND s1.ss_list_price BETWEEN 90 AND 104 AND s2.ss_list_price BETWEEN 73 AND 87 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval AND item1.i_item_sk < item2.i_item_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status order by cnt