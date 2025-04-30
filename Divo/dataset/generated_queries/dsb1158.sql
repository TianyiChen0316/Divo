--dsb_templates_query100_083_3a80aecd-adce-325e-ac39-9a37bde3a7e0.sql
--{"gen": "erase", "time": 2.1466615200042725, "template": "query100_083", "dataset": "dsb_templates", "rows": 911}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 1999 AND 1999 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 73 AND 87 AND s2.ss_list_price BETWEEN 280 AND 294 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item1.i_item_sk order by cnt