--dsb_templates_generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe_63e28158-8c30-3b3d-aa40-6371016878ac.sql
--{"gen": "erase", "time": 0.6688899993896484, "template": "generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe", "dataset": "dsb_templates", "rows": 8}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
web_sales AS web_sales
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 28 AND 48 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status order by cnt