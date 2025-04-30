--stack_templates_generated-b7cefcac-bb1e-41f7-b54e-708a3cb74dbf_fe76cead-76b7-31ff-b2f9-931fbc01f557.sql
--{"gen": "combine", "time": 1.591365098953247, "template": "generated-b7cefcac-bb1e-41f7-b54e-708a3cb74dbf", "dataset": "stack_templates", "rows": 13}
SELECT *
FROM badge AS b1,
so_user AS so_user,
account AS account,
question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s1,
answer AS a1
WHERE (b1.name = 'Caucus' AND account.website_url <> '' AND s1.site_name = 'esperanto' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
