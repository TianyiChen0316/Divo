--dsb_templates_generated-81599d2d-b5aa-472a-8bf0-ddc489f2a0bc_294d0bc7-e391-34c0-996a-405a5b48c0d5.sql
--{"gen": "erase", "time": 1.188659429550171, "template": "generated-81599d2d-b5aa-472a-8bf0-ddc489f2a0bc", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6
FROM catalog_sales AS catalog_sales,
customer AS customer,
date_dim AS date_dim,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
web_sales AS web_sales,
date_dim AS d3,
item AS item,
customer_address AS customer_address
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 43 AND 48 AND customer.c_birth_month = 7 AND date_dim.d_year = 2002 AND store_sales.ss_sales_price / store_sales.ss_list_price BETWEEN 29 * 0.01 AND 49 * 0.01 AND d3.d_moy BETWEEN 5 AND 5 + 2 AND d3.d_year = 2000 AND customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND web_sales.ws_sold_date_sk = d2.d_date_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_sold_date_sk = d3.d_date_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND date_dim.d_date_sk = d3.d_date_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND d3.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_sold_date_sk = catalog_sales.cs_sold_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 LIMIT 100