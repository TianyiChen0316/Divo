--stack_templates_generated-ec6e817a-4d49-4154-a76c-f4a14c2a4baa_94e50eeb-c78d-30ce-adce-5ddb956afaf5.sql
--{"gen": "erase", "time": 1.6071090698242188, "template": "generated-ec6e817a-4d49-4154-a76c-f4a14c2a4baa", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q2,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2,
tag_question AS tq1,
tag_question AS tq2,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'woodworking' AND t2.name = 'painting' AND b1.name = 'Reversal' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq1.site_id = s1.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
