--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_dd47542f-b997-3ed5-9594-840605fffe4e.sql
--{"gen": "erase", "time": 2.101774215698242, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2
WHERE (customer_demographics.cd_marital_status = 'M' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 216 AND 230 AND s2.ss_list_price BETWEEN 165 AND 179 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 order by cnt