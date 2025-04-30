--dsb_templates_query100_083_b4ade332-171d-3980-983c-5ac56fb560c7.sql
--{"gen": "combine", "time": 4.416928768157959, "template": "query100_083", "dataset": "dsb_templates", "rows": 7}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_demographics.cd_education_status = '2 yr Degree' AND customer_demographics.cd_marital_status = 'S' AND date_dim.d_year BETWEEN 1998 AND 1998 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 69 AND 88 AND s1.ss_list_price BETWEEN 162 AND 176 AND s2.ss_list_price BETWEEN 15 AND 29 AND item.i_category = 'Jewelry' AND store_sales.ss_wholesale_cost BETWEEN 74 AND 94 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt