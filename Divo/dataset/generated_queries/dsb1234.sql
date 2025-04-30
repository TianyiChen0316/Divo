--dsb_templates_query100_083_b5d4229a-7768-3311-b00c-a45d5d118874.sql
--{"gen": "erase", "time": 2.3148961067199707, "template": "query100_083", "dataset": "dsb_templates", "rows": 212}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'W' AND customer_demographics.cd_education_status = '2 yr Degree' AND s1.ss_list_price BETWEEN 107 AND 121 AND s2.ss_list_price BETWEEN 259 AND 273 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk)
 group by item1.i_item_sk order by cnt