--dsb_templates_generated-c0d58702-52a4-488d-a095-8d0fc09115d3_937ddcb8-8a80-3fe5-875c-7d28bdd7b9cc.sql
--{"gen": "combine", "time": 2.7951881885528564, "template": "generated-c0d58702-52a4-488d-a095-8d0fc09115d3", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
customer_demographics AS customer_demographics,
store_sales AS s1,
store_sales AS s2,
household_demographics AS household_demographics,
item AS item,
store_returns AS store_returns,
web_sales AS web_sales
WHERE (customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 81 AND 95 AND s2.ss_list_price BETWEEN 38 AND 52 AND household_demographics.hd_buy_potential = '0-500' AND household_demographics.hd_income_band_sk BETWEEN 14 AND 20 AND item.i_category IN ('Books', 'Electronics', 'Sports') AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND customer.c_current_hdemo_sk = household_demographics.hd_demo_sk AND store_returns.sr_item_sk = web_sales.ws_item_sk AND web_sales.ws_item_sk = item.i_item_sk AND store_returns.sr_item_sk = item.i_item_sk AND web_sales.ws_bill_customer_sk = customer.c_customer_sk AND web_sales.ws_bill_customer_sk = s1.ss_customer_sk)
 order by cnt