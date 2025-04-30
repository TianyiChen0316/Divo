--dsb_templates_query100_083_1be01ac4-967d-3bd7-a3bf-aaef02b3b637.sql
--{"gen": "erase", "time": 2.3210086822509766, "template": "query100_083", "dataset": "dsb_templates", "rows": 171}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 51 AND 70 AND s1.ss_list_price BETWEEN 222 AND 236 AND s2.ss_list_price BETWEEN 222 AND 236 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt