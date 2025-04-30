--dsb_templates_generated-3194e369-4e23-4b16-86f6-405bc02a1199_2a185cc7-8fed-381e-85e2-6d73e32ea71b.sql
--{"gen": "combine", "time": 0.8304846286773682, "template": "generated-3194e369-4e23-4b16-86f6-405bc02a1199", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
date_dim AS d2,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_demographics AS customer_demographics,
inventory AS inventory,
warehouse AS warehouse,
catalog_sales AS catalog_sales,
customer_address AS customer_address,
item AS item
WHERE (d2.d_moy = 3 AND d2.d_year = 2002 AND customer_address.ca_state = 'AL' AND item.i_category = 'Books' AND store_returns.sr_returned_date_sk = d2.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND inventory.inv_date_sk = store_sales.ss_sold_date_sk AND inventory.inv_item_sk = store_sales.ss_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_returns.sr_item_sk = inventory.inv_item_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_date_sk = d1.d_date_sk AND customer.c_customer_sk = store_returns.sr_customer_sk AND store_returns.sr_customer_sk = catalog_sales.cs_bill_customer_sk AND store_returns.sr_item_sk = catalog_sales.cs_item_sk AND store_sales.ss_customer_sk = catalog_sales.cs_bill_customer_sk AND catalog_sales.cs_item_sk = store_sales.ss_item_sk AND inventory.inv_item_sk = catalog_sales.cs_item_sk AND customer.c_customer_sk = catalog_sales.cs_bill_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND item.i_item_sk = catalog_sales.cs_item_sk AND item.i_item_sk = inventory.inv_item_sk AND d1.d_date BETWEEN d2.d_date - '120 day'::interval AND d2.d_date AND inventory.inv_quantity_on_hand >= store_sales.ss_quantity)
 LIMIT 100