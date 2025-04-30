--dsb_templates_query100_083_11708b59-4e10-3e85-ae0e-daecae1d2727.sql
--{"gen": "erase", "time": 2.3764588832855225, "template": "query100_083", "dataset": "dsb_templates", "rows": 45}
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
WHERE (item1.i_category IN ('Jewelry', 'Men') AND item2.i_manager_id BETWEEN 35 AND 54 AND customer_demographics.cd_marital_status = 'D' AND customer_demographics.cd_education_status = 'College' AND s1.ss_list_price BETWEEN 69 AND 83 AND s2.ss_list_price BETWEEN 246 AND 260 AND s1.ss_ticket_number = s2.ss_ticket_number AND s1.ss_item_sk = item1.i_item_sk AND s2.ss_item_sk = item2.i_item_sk AND s1.ss_customer_sk = customer.c_customer_sk AND customer.c_current_addr_sk = customer_address.ca_address_sk AND customer.c_current_cdemo_sk = customer_demographics.cd_demo_sk AND item1.i_item_sk < item2.i_item_sk)
 group by item1.i_item_sk, item2.i_item_sk order by cnt