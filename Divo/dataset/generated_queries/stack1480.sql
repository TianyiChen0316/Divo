--stack_templates_generated-f0181794-a517-4a28-a91b-a7092a4a8859_b65c54a4-1de0-3648-991c-d47220d73146.sql
--{"gen": "combine", "time": 2.3508994579315186, "template": "generated-f0181794-a517-4a28-a91b-a7092a4a8859", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (q.score > 9 AND q.score > 14 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 1 AND q1.favorite_count <= 5000 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND t2.name = 'web-applications' AND tq.question_id = q.id AND tq.site_id = q.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u2.account_id = account.id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
