--dsb_templates_query100_083_27e9c9c1-d22e-30e0-a1bc-c6de34087776.sql
--{"gen": "combine", "time": 2.7970986366271973, "template": "query100_083", "dataset": "dsb_templates", "rows": 3}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (customer_demographics.cd_education_status = 'Advanced Degree' AND customer_demographics.cd_marital_status = 'U' AND date_dim.d_year BETWEEN 1998 AND 1998 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 36 AND 55 AND s1.ss_list_price BETWEEN 169 AND 183 AND s2.ss_list_price BETWEEN 180 AND 194 AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt