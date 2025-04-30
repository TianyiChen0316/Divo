--dsb_templates_generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe_57328864-9b47-3cf7-8ada-0db13ed30dc6.sql
--{"gen": "combine", "time": 3.3853254318237305, "template": "generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe", "dataset": "dsb_templates", "rows": 8}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales,
date_dim AS date_dim,
item AS item1,
store_sales AS s1,
store_sales AS s2
WHERE (customer_address.ca_state IN ('GA', 'KS', 'NH', 'OH', 'WA') AND web_sales.ws_wholesale_cost BETWEEN 71 AND 91 AND date_dim.d_year BETWEEN 2000 AND 2000 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 81 AND 95 AND s2.ss_list_price BETWEEN 136 AND 150 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status order by cnt