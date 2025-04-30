--dsb_templates_generated-40439e44-0d33-4afa-bf88-1686972c126d_5aa5ff1c-7d4e-324e-b294-6a2b40599ba5.sql
--{"gen": "combine", "time": 2.7401041984558105, "template": "generated-40439e44-0d33-4afa-bf88-1686972c126d", "dataset": "dsb_templates", "rows": 3}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
store_returns AS store_returns
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 10 AND 29 AND s1.ss_list_price BETWEEN 128 AND 142 AND s2.ss_list_price BETWEEN 14 AND 28 AND customer_address.ca_city = 'Highland Park' AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt