--dsb_templates_generated-2e1d4f19-c2ee-4808-834b-11c454c1e33f_6bd2ac2f-649f-38a3-89ee-7218efc2a3a8.sql
--{"gen": "combine", "time": 0.3313899040222168, "template": "generated-2e1d4f19-c2ee-4808-834b-11c454c1e33f", "dataset": "dsb_templates", "rows": 1}
SELECT item.i_item_desc,
item.i_item_id,
max(catalog_sales.cs_net_profit) AS catalog_sales_profit,
max(store_returns.sr_net_loss) AS store_returns_loss,
max(store_sales.ss_net_profit) AS store_sales_profit,
store.s_store_id,
store.s_store_name
FROM catalog_sales AS catalog_sales,
item AS item,
store AS store,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band
WHERE (customer_address.ca_city = 'Lincoln' AND income_band.ib_lower_bound >= 6215 AND income_band.ib_upper_bound <= 58636 + 50000 AND item.i_item_sk = store_sales.ss_item_sk AND store.s_store_sk = store_sales.ss_store_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 group by item.i_item_desc, item.i_item_id, store.s_store_id, store.s_store_name order by item.i_item_id, item.i_item_desc, store.s_store_id, store.s_store_name LIMIT 100