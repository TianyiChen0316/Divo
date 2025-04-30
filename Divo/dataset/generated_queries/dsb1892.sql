--dsb_templates_query100_083_33b0d984-09de-3cea-8828-ca86d7213bea.sql
--{"gen": "erase", "time": 2.316641330718994, "template": "query100_083", "dataset": "dsb_templates", "rows": 1635}
SELECT count(*) AS cnt,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 1999 AND 1999 + 1 AND item2.i_manager_id BETWEEN 60 AND 79 AND s1.ss_list_price BETWEEN 286 AND 300 AND s2.ss_list_price BETWEEN 12 AND 26 AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk)
 group by item2.i_item_sk order by cnt