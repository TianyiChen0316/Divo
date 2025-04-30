--dsb_templates_generated-352ab4e1-70d3-4ba7-8c6e-8aa88b458207_8af0a14c-3a79-3081-bd99-ca5bd2221837.sql
--{"gen": "combine", "time": 0.4572603702545166, "template": "generated-352ab4e1-70d3-4ba7-8c6e-8aa88b458207", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 30 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 60 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 90 AND catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when catalog_sales.cs_ship_date_sk - catalog_sales.cs_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM catalog_sales AS catalog_sales,
date_dim AS date_dim,
customer AS customer,
customer_address AS customer_address,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (date_dim.d_month_seq BETWEEN 1195 AND 1195 + 23 AND catalog_sales.cs_list_price BETWEEN 49 AND 78 AND customer.c_birth_month = 1 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND item.i_category = 'Women' AND catalog_sales.cs_ship_date_sk = date_dim.d_date_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = store_returns.sr_item_sk AND item.i_item_sk = web_sales.ws_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk)
 LIMIT 100