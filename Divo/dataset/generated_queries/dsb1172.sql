--dsb_templates_generated-da411b70-1e3d-4632-8b6d-9c6bfbc07025_beb62eee-0262-350f-bb7a-028d0dfb43d8.sql
--{"gen": "erase", "time": 0.44797277450561523, "template": "generated-da411b70-1e3d-4632-8b6d-9c6bfbc07025", "dataset": "dsb_templates", "rows": 100}
SELECT coalesce(customer.c_last_name, '') || ', ' || coalesce(customer.c_first_name, '') AS customername,
customer.c_customer_id AS customer_id
FROM customer AS customer,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics
WHERE (customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk)
 order by customer.c_customer_id LIMIT 100