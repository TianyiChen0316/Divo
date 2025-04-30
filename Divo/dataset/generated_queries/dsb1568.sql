--dsb_templates_generated-042678ee-d2ec-402c-8448-9e43e4d3e2c0_35fdbf21-c3f8-34ff-84bf-a5c0c35407ca.sql
--{"gen": "erase", "time": 1.596769094467163, "template": "generated-042678ee-d2ec-402c-8448-9e43e4d3e2c0", "dataset": "dsb_templates", "rows": 28}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
store_returns AS store_returns,
item AS item,
store_sales AS store_sales
WHERE (customer_address.ca_city = 'Glenwood' AND item.i_category = 'Music' AND store_sales.ss_wholesale_cost BETWEEN 54 AND 74 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_item_sk = item.i_item_sk)
 order by customer.c_customer_id LIMIT 100