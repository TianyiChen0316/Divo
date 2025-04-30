--dsb_templates_generated-dcd17804-6847-4279-a6c1-1457ad8228bb_6a8d3adb-7db7-3563-8e9b-6635007b96e1.sql
--{"gen": "erase", "time": 2.8369297981262207, "template": "generated-dcd17804-6847-4279-a6c1-1457ad8228bb", "dataset": "dsb_templates", "rows": 2281}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
item AS item1,
store_sales AS s1,
store_sales AS s2,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 106 AND 120 AND s2.ss_list_price BETWEEN 105 AND 119 AND income_band.ib_lower_bound >= 46057 AND income_band.ib_upper_bound <= 40708 + 50000 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 group by item1.i_item_sk order by cnt