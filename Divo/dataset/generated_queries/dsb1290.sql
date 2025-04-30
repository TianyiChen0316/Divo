--dsb_templates_query100_083_ed5352bc-191a-3d5a-bbdf-e60d01a44b43.sql
--{"gen": "erase", "time": 2.359071969985962, "template": "query100_083", "dataset": "dsb_templates", "rows": 463}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (date_dim.d_year BETWEEN 1999 AND 1999 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 66 AND 85 AND s1.ss_list_price BETWEEN 180 AND 194 AND s2.ss_list_price BETWEEN 146 AND 160 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt