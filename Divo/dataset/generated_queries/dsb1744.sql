--dsb_templates_generated-dcd17804-6847-4279-a6c1-1457ad8228bb_74b1290b-6707-37d4-9e03-39caf79ce298.sql
--{"gen": "erase", "time": 0.47062015533447266, "template": "generated-dcd17804-6847-4279-a6c1-1457ad8228bb", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt
FROM customer AS customer,
store_sales AS s1,
store_sales AS s2,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (s1.ss_list_price BETWEEN 259 AND 273 AND s2.ss_list_price BETWEEN 12 AND 26 AND income_band.ib_lower_bound >= 52251 AND income_band.ib_upper_bound <= 7418 + 50000 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_customer_sk = customer.c_customer_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 order by cnt