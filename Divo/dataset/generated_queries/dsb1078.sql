--dsb_templates_generated-c0d58702-52a4-488d-a095-8d0fc09115d3_2ba9f0e2-2650-3797-b71d-ceb39867f487.sql
--{"gen": "combine", "time": 0.8050458431243896, "template": "generated-c0d58702-52a4-488d-a095-8d0fc09115d3", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 256 AND 270 AND s2.ss_list_price BETWEEN 105 AND 119 AND customer_address.ca_state = 'AK' AND item.i_category = 'Women' AND store_sales.ss_wholesale_cost BETWEEN 18 AND 38 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = s1.ss_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by cnt