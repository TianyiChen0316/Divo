--dsb_templates_generated-c0d58702-52a4-488d-a095-8d0fc09115d3_d14ea664-33a3-3aae-8d74-7eb470a8921f.sql
--{"gen": "erase", "time": 1.582216501235962, "template": "generated-c0d58702-52a4-488d-a095-8d0fc09115d3", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1
WHERE (customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = '4 yr Degree' AND s1.ss_list_price BETWEEN 16 AND 30 AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 order by cnt