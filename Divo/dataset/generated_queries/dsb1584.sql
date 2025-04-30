--dsb_templates_generated-deaec7b8-8c96-4b78-887c-db22d5313ca4_5d3bdf33-5929-3269-bb0f-22d3bb04de8b.sql
--{"gen": "erase", "time": 0.6909670829772949, "template": "generated-deaec7b8-8c96-4b78-887c-db22d5313ca4", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
inventory AS inventory,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales,
customer_address AS customer_address,
date_dim AS d1,
date_dim AS d2
WHERE (web_sales.ws_wholesale_cost BETWEEN 31 AND 51 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND d1.d_year = 2002 AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND web_sales.ws_sold_date_sk = d2.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND d1.d_date_sk = inventory.inv_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 order by customer.c_customer_id LIMIT 100