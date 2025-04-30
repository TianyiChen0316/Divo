--dsb_templates_generated-0113934f-b079-41ef-9d83-bf63176abbe3_54e76a1e-d426-3ef4-a8f5-63361f6e3cf6.sql
--{"gen": "erase", "time": 2.5962722301483154, "template": "generated-0113934f-b079-41ef-9d83-bf63176abbe3", "dataset": "dsb_templates", "rows": 1910}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
item AS item1,
store_sales AS s1,
store_sales AS s2,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
store_returns AS store_returns
WHERE (item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 23 AND 37 AND s2.ss_list_price BETWEEN 261 AND 275 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 group by item1.i_item_sk order by cnt