--stack_templates_generated-17e4b784-140f-49bd-93f2-50924b35b826_958a93a0-9bc3-3378-a298-bbebd97b2351.sql
--{"gen": "combine", "time": 0.8070106506347656, "template": "generated-17e4b784-140f-49bd-93f2-50924b35b826", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u2,
question AS q
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10 AND q1.favorite_count <= 1 AND s1.site_name = 'electronics' AND s2.site_name = 'raspberrypi' AND q.score > 8 AND q.score >= 0 AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND s2.site_id = u2.site_id AND tq.question_id = q.id AND tq.site_id = a1.site_id AND tq.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND tq.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id AND q1.owner_user_id = a1.owner_user_id)
