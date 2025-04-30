--stack_templates_generated-33756a81-e67b-4aff-9e37-1da19b33183a_d323cbe4-5928-3402-b1c7-2dceca7684d4.sql
--{"gen": "erase", "time": 0.2975482940673828, "template": "generated-33756a81-e67b-4aff-9e37-1da19b33183a", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
answer AS a1,
site AS s1,
question AS q2,
so_user AS u2,
badge AS b2
WHERE (q.score > 8 AND q.score > 9 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10000 AND q1.favorite_count >= 0 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s1.site_name = 'magento' AND b2.name = 'Famous Question' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = a1.site_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND a1.owner_user_id = b1.user_id AND a1.owner_user_id = q1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND a1.site_id = q.site_id AND s1.site_id = q.site_id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND b2.user_id = a1.owner_user_id AND tq.site_id = b2.site_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND t.site_id = b2.site_id AND a1.site_id = b2.site_id AND s1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND b2.site_id = q.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval AND b2.date > b1.date + '11 months'::interval)
