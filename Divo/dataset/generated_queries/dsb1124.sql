--dsb_templates_query100_083_e9908edd-7b9a-3cd2-a93a-aecb244b1a13.sql
--{"gen": "erase", "time": 2.4288275241851807, "template": "query100_083", "dataset": "dsb_templates", "rows": 135}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item2.i_manager_id BETWEEN 64 AND 83 AND customer_demographics.cd_marital_status = 'U' AND customer_demographics.cd_education_status = 'Advanced Degree' AND s1.ss_list_price BETWEEN 90 AND 104 AND s2.ss_list_price BETWEEN 200 AND 214 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item2.i_item_sk order by cnt