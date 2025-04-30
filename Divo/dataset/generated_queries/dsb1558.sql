--dsb_templates_query100_083_d67681e6-d26f-3f23-b2f1-fff3a8ef682d.sql
--{"gen": "erase", "time": 1.5147786140441895, "template": "query100_083", "dataset": "dsb_templates", "rows": 197}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
date_dim AS date_dim,
item AS item1,
store_sales AS s1
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND customer_demographics.cd_marital_status = 'M' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 197 AND 211 AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item1.i_item_sk order by cnt