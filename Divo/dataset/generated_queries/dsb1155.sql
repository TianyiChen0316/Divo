--dsb_templates_generated-ba1b1ba1-5801-49b0-8bb5-5d7fc6733c07_e72d891e-5c91-397e-a000-b380f9a33806.sql
--{"gen": "combine", "time": 1.96217942237854, "template": "generated-ba1b1ba1-5801-49b0-8bb5-5d7fc6733c07", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
item AS item,
store AS store,
store_sales AS store_sales,
item AS item1,
item AS item2
WHERE (customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 43 AND 57 AND s2.ss_list_price BETWEEN 112 AND 126 AND customer_address.ca_state = 'OK' AND item.i_category = 'Music' AND store_sales.ss_wholesale_cost BETWEEN 9 AND 29 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 62 AND 81 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5) AND item1.i_item_sk < item2.i_item_sk)
 order by cnt