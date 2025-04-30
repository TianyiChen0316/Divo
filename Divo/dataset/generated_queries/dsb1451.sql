--dsb_templates_generated-a058c7d8-30c7-4e3f-87c4-3a5f80f00ea0_ea3e0b6d-5edf-3a10-9517-388da09e6ea8.sql
--{"gen": "erase", "time": 4.334318399429321, "template": "generated-a058c7d8-30c7-4e3f-87c4-3a5f80f00ea0", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
date_dim AS d1,
date_dim AS d2,
inventory AS inventory,
warehouse AS warehouse,
web_sales AS web_sales
WHERE (d1.d_year = 1998 AND web_sales.ws_wholesale_cost BETWEEN 28 AND 48 AND web_sales.ws_sold_date_sk = d2.d_date_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_warehouse_sk = inventory.inv_warehouse_sk AND web_sales.ws_warehouse_sk = warehouse.w_warehouse_sk AND inventory.inv_warehouse_sk = warehouse.w_warehouse_sk AND web_sales.ws_item_sk = inventory.inv_item_sk AND d1.d_date_sk = inventory.inv_date_sk AND d2.d_date BETWEEN d1.d_date AND d1.d_date + '30 day'::interval)
 order by cnt