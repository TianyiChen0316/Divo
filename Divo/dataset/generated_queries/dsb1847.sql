--dsb_templates_generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe_ba4b820c-8ea3-3719-9b7b-c668f5cbd9fd.sql
--{"gen": "combine", "time": 3.2186391353607178, "template": "generated-346675bf-6f4d-4a4b-858d-0ad354bf44fe", "dataset": "dsb_templates", "rows": 46}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status
FROM customer AS customer,
customer_demographics AS customer_demographics,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales,
date_dim AS date_dim,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (web_sales.ws_wholesale_cost BETWEEN 57 AND 77 AND date_dim.d_year BETWEEN 1998 AND 1998 + 1 AND item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 39 AND 58 AND s1.ss_list_price BETWEEN 205 AND 219 AND s2.ss_list_price BETWEEN 96 AND 110 AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND date_dim.d_date_sk = s1.ss_sold_date_sk AND s1.ss_customer_sk = customer.c_customer_sk AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_ticket_number = s2.ss_ticket_number AND s2.ss_item_sk = item2.i_item_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk AND item1.i_item_sk < item2.i_item_sk)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status order by cnt