--dsb_templates_generated-f9c9b0d7-1a18-484a-8b97-24c2ad067fb8_7b56e34c-4153-3dac-9dd6-6cbc3fc918bd.sql
--{"gen": "combine", "time": 2.5215792655944824, "template": "generated-f9c9b0d7-1a18-484a-8b97-24c2ad067fb8", "dataset": "dsb_templates", "rows": 1}
SELECT sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 30 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 60) then 1 else 0 end) AS "31-60 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 60 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 90) then 1 else 0 end) AS "61-90 days",
sum(case when (store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 90 AND store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 120) then 1 else 0 end) AS "91-120 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk <= 30 then 1 else 0 end) AS "30 days",
sum(case when store_returns.sr_returned_date_sk - store_sales.ss_sold_date_sk > 120 then 1 else 0 end) AS ">120 days"
FROM date_dim AS d1,
store_returns AS store_returns,
store_sales AS store_sales,
customer AS customer,
customer_address AS customer_address,
item AS item,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('CA', 'IA', 'KY', 'MA', 'VA') AND item.i_category IN ('Books', 'Electronics', 'Sports') AND store_sales.ss_ticket_number = store_returns.sr_ticket_number AND store_sales.ss_item_sk = store_returns.sr_item_sk AND store_sales.ss_sold_date_sk = d1.d_date_sk AND store_sales.ss_customer_sk = store_returns.sr_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND item.i_item_sk = store_sales.ss_item_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_customer_sk = web_sales.ws_bill_customer_sk AND store_sales.ss_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = store_returns.sr_customer_sk AND customer.c_customer_sk = store_returns.sr_customer_sk)
 LIMIT 100