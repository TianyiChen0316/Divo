--dsb_templates_generated-331c4192-b12a-4f9f-8fb7-cf8c95addf3f_86ae5c72-7652-3f24-abf1-2e04462bef81.sql
--{"gen": "combine", "time": 3.5950050354003906, "template": "generated-331c4192-b12a-4f9f-8fb7-cf8c95addf3f", "dataset": "dsb_templates", "rows": 1}
SELECT avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM customer AS customer,
date_dim AS date_dim,
store AS store,
store_sales AS store_sales,
date_dim AS d1,
store_returns AS store_returns,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
catalog_sales AS catalog_sales,
customer_address AS customer_address,
date_dim AS d2,
web_sales AS web_sales
WHERE (customer.c_birth_month = 11 AND date_dim.d_year = 1999 AND store.s_state = 'AR' AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 59 AND 78 AND s1.ss_list_price BETWEEN 79 AND 93 AND s2.ss_list_price BETWEEN 275 AND 289 AND catalog_sales.cs_wholesale_cost BETWEEN 37 AND 42 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND date_dim.d_date_sk = d1.d_date_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND customer.c_current_cdemo_sk = store_sales.ss_cdemo_sk AND d1.d_date_sk = s1.ss_sold_date_sk AND store_sales.ss_sold_date_sk = s1.ss_sold_date_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND d1.d_date_sk = catalog_sales.cs_sold_date_sk AND s1.ss_sold_date_sk = catalog_sales.cs_sold_date_sk AND store_sales.ss_sold_date_sk = catalog_sales.cs_sold_date_sk AND s1.ss_customer_sk = store_returns.sr_customer_sk AND s1.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND s1.ss_customer_sk = store_sales.ss_customer_sk AND s1.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_customer_sk = customer.c_customer_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND item1.i_item_sk < item2.i_item_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '90 day'::interval)
 LIMIT 100