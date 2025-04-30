--dsb_templates_generated-a058c7d8-30c7-4e3f-87c4-3a5f80f00ea0_fdee8c5b-0d48-3c26-bd87-b110a4a39ddf.sql
--{"gen": "erase", "time": 4.549206972122192, "template": "generated-a058c7d8-30c7-4e3f-87c4-3a5f80f00ea0", "dataset": "dsb_templates", "rows": 52}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status
FROM customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS d1,
date_dim AS d2,
inventory AS inventory,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (d1.d_year = 1998 AND web_sales.ws_wholesale_cost BETWEEN 22 AND 42 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status order by cnt