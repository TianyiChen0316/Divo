--dsb_templates_generated-93010633-8486-40ec-8c45-d7228ed78648_93ec05e0-1c09-3aba-a101-b7f63b8e5f13.sql
--{"gen": "erase", "time": 1.0382556915283203, "template": "generated-93010633-8486-40ec-8c45-d7228ed78648", "dataset": "dsb_templates", "rows": 1}
SELECT avg(catalog_sales.cs_coupon_amt::numeric(12, 2)) AS agg3,
avg(catalog_sales.cs_list_price::numeric(12, 2)) AS agg2,
avg(catalog_sales.cs_net_profit::numeric(12, 2)) AS agg5,
avg(catalog_sales.cs_quantity::numeric(12, 2)) AS agg1,
avg(catalog_sales.cs_sales_price::numeric(12, 2)) AS agg4,
avg(customer.c_birth_year::numeric(12, 2)) AS agg6,
item.i_item_id
FROM catalog_sales AS catalog_sales,
customer AS customer,
date_dim AS date_dim,
item AS item,
store AS store,
store_sales AS store_sales
WHERE (catalog_sales.cs_wholesale_cost BETWEEN 15 AND 20 AND customer.c_birth_month = 5 AND date_dim.d_year = 1998 AND item.i_category = 'Music' AND store_sales.ss_wholesale_cost BETWEEN 46 AND 66 AND catalog_sales.cs_bill_customer_sk = customer.c_customer_sk AND catalog_sales.cs_item_sk = item.i_item_sk AND catalog_sales.cs_sold_date_sk = date_dim.d_date_sk AND date_dim.d_date_sk = store_sales.ss_sold_date_sk AND store_sales.ss_item_sk = item.i_item_sk AND store_sales.ss_customer_sk = customer.c_customer_sk AND store_sales.ss_store_sk = store.s_store_sk AND store_sales.ss_item_sk = catalog_sales.cs_item_sk AND catalog_sales.cs_bill_customer_sk = store_sales.ss_customer_sk AND catalog_sales.cs_sold_date_sk = store_sales.ss_sold_date_sk)
 group by rollup(item.i_item_id) order by item.i_item_id LIMIT 100