--dsb_templates_generated-a058c7d8-30c7-4e3f-87c4-3a5f80f00ea0_c5333ec5-2899-32db-bd46-b3f195472d0a.sql
--{"gen": "combine", "time": 3.4380009174346924, "template": "generated-a058c7d8-30c7-4e3f-87c4-3a5f80f00ea0", "dataset": "dsb_templates", "rows": 5}
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
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 2000 AND web_sales.ws_wholesale_cost BETWEEN 61 AND 81 AND date_dim.d_year BETWEEN 1999 AND 1999 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 61 AND 80 AND s1.ss_list_price BETWEEN 79 AND 93 AND s2.ss_list_price BETWEEN 93 AND 107 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval AND item1.i_item_sk < item2.i_item_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status order by cnt