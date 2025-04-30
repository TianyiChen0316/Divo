--stack_templates_generated-e14ed774-e827-4ec0-9afb-d1082b29ac04_cb8e86d9-ff12-33fc-b084-a54d82bc30ba.sql
--{"gen": "erase", "time": 0.5690262317657471, "template": "generated-e14ed774-e827-4ec0-9afb-d1082b29ac04", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
answer AS a1,
site AS s1,
badge AS b1,
so_user AS so_user
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 5 AND q1.favorite_count >= 5 AND s1.site_name = 'scifi' AND b1.name = 'Synonymizer' AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = so_user.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id)
