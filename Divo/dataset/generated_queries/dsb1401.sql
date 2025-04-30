--dsb_templates_generated-c0d58702-52a4-488d-a095-8d0fc09115d3_fb46ceb5-95c1-345b-b9e6-08b2b7fd86d3.sql
--{"gen": "erase", "time": 1.5147709846496582, "template": "generated-c0d58702-52a4-488d-a095-8d0fc09115d3", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1
WHERE (customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = 'College' AND s1.ss_list_price BETWEEN 79 AND 93 AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 order by cnt