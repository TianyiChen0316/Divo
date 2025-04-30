--stack_templates_generated-713e9162-90da-460e-888c-34579dca33e7_3f10dcfb-2623-32bf-8276-5d10cfe9bdac.sql
--{"gen": "combine", "time": 0.7797527313232422, "template": "generated-713e9162-90da-460e-888c-34579dca33e7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
site AS s1,
site AS s2,
so_user AS u2,
tag AS t2
WHERE (q.score > 7 AND q.score > 11 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10 AND q1.favorite_count >= 1 AND s1.site_name = 'lifehacks' AND s2.site_name = 'english' AND t2.name = 'nginx' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t2.site_id = s2.site_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND tq.site_id = s1.site_id AND u1.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id AND t2.site_id = u2.site_id AND s2.site_id = u2.site_id)
