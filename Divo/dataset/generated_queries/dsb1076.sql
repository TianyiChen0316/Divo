--dsb_templates_query100_083_5bbe1a66-62ff-3b4d-a547-b215e4b8055b.sql
--{"gen": "erase", "time": 2.870131254196167, "template": "query100_083", "dataset": "dsb_templates", "rows": 67}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 1999 AND 1999 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = 'Advanced Degree' AND s1.ss_list_price BETWEEN 193 AND 207 AND s2.ss_list_price BETWEEN 186 AND 200 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item1.i_item_sk order by cnt