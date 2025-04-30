--dsb_templates_generated-3220db27-c8b9-4b71-ac25-458f05800405_2e80739c-a1ae-3280-8906-f6f67736a30b.sql
--{"gen": "erase", "time": 5.06251335144043, "template": "generated-3220db27-c8b9-4b71-ac25-458f05800405", "dataset": "dsb_templates", "rows": 310}
SELECT count(*) AS cnt,
customer_demographics.cd_education_status,
customer_demographics.cd_gender,
customer_demographics.cd_marital_status,
household_demographics.hd_vehicle_count
FROM customer AS customer,
customer_demographics AS customer_demographics,
date_dim AS d1,
date_dim AS d2,
household_demographics AS household_demographics,
inventory AS inventory,
store AS store,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (d1.d_year = 2002 AND web_sales.ws_wholesale_cost BETWEEN 65 AND 85 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND store.s_state = warehouse.w_state AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 group by customer_demographics.cd_education_status, customer_demographics.cd_gender, customer_demographics.cd_marital_status, household_demographics.hd_vehicle_count order by cnt