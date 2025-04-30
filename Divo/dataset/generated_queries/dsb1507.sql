--dsb_templates_query100_083_097b4bfa-e5a9-3893-aba4-f5cb7f407ea5.sql
--{"gen": "erase", "time": 2.590169668197632, "template": "query100_083", "dataset": "dsb_templates", "rows": 437}
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
WHERE (date_dim.d_year BETWEEN 1998 AND 1998 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 18 AND 37 AND s1.ss_list_price BETWEEN 182 AND 196 AND s2.ss_list_price BETWEEN 180 AND 194 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt