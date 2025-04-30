--dsb_templates_generated-40439e44-0d33-4afa-bf88-1686972c126d_78751d48-3c33-3b89-b4b3-f22c8a43763d.sql
--{"gen": "combine", "time": 2.6095943450927734, "template": "generated-40439e44-0d33-4afa-bf88-1686972c126d", "dataset": "dsb_templates", "rows": 1}
SELECT count(*) AS cnt,
item1.i_item_sk
FROM customer AS customer,
item AS item1,
store_sales AS s1,
store_sales AS s2,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
household_demographics AS household_demographics,
income_band AS income_band,
store_returns AS store_returns
WHERE (item1.i_category IN ('Jewelry', 'Men') AND s1.ss_list_price BETWEEN 212 AND 226 AND s2.ss_list_price BETWEEN 106 AND 120 AND customer_address.ca_city = 'Mount Olive' AND income_band.ib_lower_bound >= 1537 AND income_band.ib_upper_bound <= 23766 + 50000 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer_demographics.cd_demo_sk = customer.c_current_cdemo_sk AND household_demographics.hd_demo_sk = customer.c_current_hdemo_sk AND income_band.ib_income_band_sk = household_demographics.hd_income_band_sk AND store_returns.sr_cdemo_sk = customer_demographics.cd_demo_sk AND store_returns.sr_cdemo_sk = customer.c_current_cdemo_sk)
 group by item1.i_item_sk order by cnt