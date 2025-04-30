--stack_templates_9c84481b1d678f23720f9f9491e37a3e3db215f2_ee31280c-a3e1-3245-bde7-c3be40566c78.sql
--{"gen": "combine", "time": 0.3473198413848877, "template": "9c84481b1d678f23720f9f9491e37a3e3db215f2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account
WHERE (q.score >= 0 AND q.score > 13 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 0 AND q1.favorite_count >= 0 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tq.question_id = q.id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND account.id = u1.account_id AND tq.site_id = t.site_id AND tq.site_id = q.site_id AND t1.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id)
