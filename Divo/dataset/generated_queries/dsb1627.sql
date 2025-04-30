--dsb_templates_generated-40439e44-0d33-4afa-bf88-1686972c126d_60c63b03-721d-3604-939a-0c3f36022fa3.sql
--{"gen": "combine", "time": 2.738494634628296, "template": "generated-40439e44-0d33-4afa-bf88-1686972c126d", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
catalog_sales AS catalog_sales,
customer_address AS customer_address,
date_dim AS date_dim,
item AS item
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 71 AND 90 AND s1.ss_list_price BETWEEN 82 AND 96 AND s2.ss_list_price BETWEEN 120 AND 134 AND catalog_sales.cs_wholesale_cost BETWEEN 10 AND 15 AND customer_address.ca_state IN ('MS', 'NE', 'PA') AND date_dim.d_year = 1999 AND item.i_category = 'Books' AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND catalog_sales.cs_bill_customer_sk = s1.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt