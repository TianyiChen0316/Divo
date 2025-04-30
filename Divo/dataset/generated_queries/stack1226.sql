--stack_templates_q6-072_7725fce3-816b-33f4-bc9e-bbee70dff5ca.sql
--{"gen": "combine", "time": 0.20103693008422852, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
badge AS b1,
site AS s
WHERE (s1.site_name = 'math' AND t1.name IN ('copyright', 'sunyata') AND acc.website_url ILIKE '%code%' AND s.site_name = 'serverfault' AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND acc.id = u1.account_id AND b1.user_id = u1.id AND s.site_id = b1.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND account.id = acc.id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND s.site_id = s1.site_id AND s.site_id = c1.site_id AND u1.site_id = b1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND b1.site_id = q1.site_id AND b1.site_id = s1.site_id AND b1.site_id = tq1.site_id AND b1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND q1.owner_user_id = b1.user_id AND tq1.question_id = c1.post_id AND c1.score > q1.score)
