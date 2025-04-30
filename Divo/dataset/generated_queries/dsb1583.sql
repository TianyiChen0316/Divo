--dsb_templates_generated-34a7fcfb-d7f7-4b03-9801-2c6c8a87c124_5f286e15-c4d3-3f9b-a75e-d1f6f6f4840e.sql
--{"gen": "erase", "time": 0.9816703796386719, "template": "generated-34a7fcfb-d7f7-4b03-9801-2c6c8a87c124", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer AS customer,
item AS item,
store_returns AS store_returns
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 5 AND 10 AND customer.c_birth_month = 10 AND item.i_category = 'Electronics' AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = store_returns.sr_cdemo_sk AND catalog_sales.cs_bill_cdemo_sk = customer.c_current_cdemo_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100