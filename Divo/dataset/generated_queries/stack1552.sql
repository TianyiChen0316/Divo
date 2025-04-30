--stack_templates_generated-5c499328-7f52-49bb-b851-cf42b095412c_107b6555-6a05-31d1-a8a2-b97ece68e582.sql
--{"gen": "erase", "time": 1.6191744804382324, "template": "generated-5c499328-7f52-49bb-b851-cf42b095412c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
badge AS b
WHERE (s1.site_name = 'security' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND u1.site_id = a1.site_id AND u1.site_id = s1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id)
