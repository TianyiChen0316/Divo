--dsb_templates_query100_083_eaedaf96-0fd2-32a7-a089-f753c77d8193.sql
--{"gen": "erase", "time": 2.4993350505828857, "template": "query100_083", "dataset": "dsb_templates", "rows": 46}
SELECT count(*) AS cnt,
item1.i_item_sk,
item2.i_item_sk
FROM customer AS customer,
customer_address AS customer_address,
customer_demographics AS customer_demographics,
item AS item1,
item AS item2,
store_sales AS s1,
store_sales AS s2
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 69 AND 88 AND customer_demographics.cd_marital_status = 'S' AND customer_demographics.cd_education_status = 'Unknown' AND s1.ss_list_price BETWEEN 105 AND 119 AND s2.ss_list_price BETWEEN 143 AND 157 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt