--dsb_templates_generated-da411b70-1e3d-4632-8b6d-9c6bfbc07025_81923e6c-3513-3a43-98aa-69d39de9fae8.sql
--{"gen": "erase", "time": 0.9889054298400879, "template": "generated-da411b70-1e3d-4632-8b6d-9c6bfbc07025", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_returns AS store_returns
WHERE (customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by customer.c_customer_id LIMIT 100