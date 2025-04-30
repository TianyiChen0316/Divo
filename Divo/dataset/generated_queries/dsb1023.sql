--dsb_templates_generated-88a5d437-3779-4f69-b11b-eb9048174c94_08598d22-61da-3dee-a184-d12ca91e5c1e.sql
--{"gen": "erase", "time": 2.1621954441070557, "template": "generated-88a5d437-3779-4f69-b11b-eb9048174c94", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2
WHERE (customer_demographics.cd_marital_status = 'M' AND customer_demographics.cd_education_status = 'Secondary' AND s1.ss_list_price BETWEEN 18 AND 32 AND s2.ss_list_price BETWEEN 280 AND 294 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 order by cnt