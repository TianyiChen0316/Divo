--stack_templates_generated-c7b0ad0b-1ec3-45fc-93e7-25ad7c1f66ee_ead2a0e2-b826-332a-a45c-7285ebd6e098.sql
--{"gen": "erase", "time": 1.2890000343322754, "template": "generated-c7b0ad0b-1ec3-45fc-93e7-25ad7c1f66ee", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1
WHERE (account.website_url <> '' AND s1.site_name = 'vegetarianism' AND account.id = so_user.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
