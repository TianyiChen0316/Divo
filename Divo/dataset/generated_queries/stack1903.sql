--stack_templates_generated-ec6e817a-4d49-4154-a76c-f4a14c2a4baa_ece85c78-07cc-3299-a22e-a96236be5f15.sql
--{"gen": "erase", "time": 1.3714747428894043, "template": "generated-ec6e817a-4d49-4154-a76c-f4a14c2a4baa", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t2,
tag_question AS tq1,
so_user AS so_user
WHERE (s1.site_name = 'raspberrypi' AND s2.site_name = 'tex' AND t2.name = 'at-command' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q2.owner_user_id = u2.id AND q2.site_id = s2.site_id AND q2.site_id = u2.site_id AND t2.site_id = s2.site_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = so_user.account_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND s2.site_id = u2.site_id)
