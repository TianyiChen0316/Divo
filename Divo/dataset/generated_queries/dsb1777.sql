--dsb_templates_generated-dda050d1-8d31-46a9-a4ca-ab9f0168ab08_93ec05e0-1c09-3aba-a101-b7f63b8e5f13.sql
--{"gen": "combine", "time": 0.5496220588684082, "template": "generated-dda050d1-8d31-46a9-a4ca-ab9f0168ab08", "dataset": "dsb_templates", "rows": 1}
SELECT sum(store_sales.ss_ext_sales_price) AS ext_price
FROM customer AS customer,
customer_address AS customer_address,
store AS store,
store_sales AS store_sales,
catalog_sales AS catalog_sales,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item,
date_dim AS d1,
store_returns AS store_returns,
call_center AS call_center,
warehouse AS warehouse,
household_demographics AS household_demographics,
web_sales AS web_sales
WHERE (customer_address.ca_state = 'WI' AND customer.c_birth_month = 7 AND store_sales.ss_wholesale_cost BETWEEN 78 AND 98 AND catalog_sales.cs_wholesale_cost BETWEEN 21 AND 26 AND customer_demographics.cd_education_status = 'Unknown' AND customer_demographics.cd_gender = 'M' AND date_dim.d_year = 1999 AND item.i_category = 'Men' AND call_center.cc_class = 'small' AND warehouse.w_gmt_offset = -5 AND household_demographics.hd_income_band_sk BETWEEN 0 AND 6 AND household_demographics.hd_buy_potential = '5001-10000' AND store_sales.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_store_sk = store.s_store_sk AND catalog_sales.cs_bill_cdemo_sk = customer_demographics.cd_demo_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_cdemo_sk = customer_demographics.cd_demo_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_sold_date_sk = date_dim.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_returns.sr_item_sk = item.i_item_sk AND date_dim.d_date_sk = d1.d_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_cdemo_sk = store_sales.ss_cdemo_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND d1.d_date_sk = catalog_sales.cs_sold_date_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk AND catalog_sales.cs_warehouse_sk = warehouse.w_warehouse_sk AND catalog_sales.cs_call_center_sk = call_center.cc_call_center_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND customer.c_customer_sk = web_sales.ws_bill_customer_sk AND item.i_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = catalog_sales.cs_item_sk AND web_sales.ws_item_sk = store_sales.ss_item_sk AND store_returns.sr_customer_sk = web_sales.ws_bill_customer_sk AND catalog_sales.cs_bill_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND pg_catalog.substring(customer_address.ca_zip, 1, 5) <> pg_catalog.substring(store.s_zip, 1, 5))
 order by ext_price desc LIMIT 100