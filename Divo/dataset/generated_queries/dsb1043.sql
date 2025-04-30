--dsb_templates_generated-0d65460a-9a4a-49e0-b662-a9a36caec17b_0c7fdb5b-ba51-3d90-9397-47cc71e6fcdd.sql
--{"gen": "erase", "time": 0.9881911277770996, "template": "generated-0d65460a-9a4a-49e0-b662-a9a36caec17b", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
store_returns AS store_returns
WHERE (customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100