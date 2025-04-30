--dsb_templates_generated-7c2733a6-f407-47c1-9582-3015087d3ee2_6df96199-8996-3b35-b3c9-ccf8292a463a.sql
--{"gen": "erase", "time": 2.280697822570801, "template": "generated-7c2733a6-f407-47c1-9582-3015087d3ee2", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2
WHERE (customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = '2 yr Degree' AND s1.ss_list_price BETWEEN 191 AND 205 AND s2.ss_list_price BETWEEN 120 AND 134 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 order by cnt