--stack_templates_generated-f0181794-a517-4a28-a91b-a7092a4a8859_43794920-a13a-3716-80a9-9968d934b4ba.sql
--{"gen": "combine", "time": 0.10402321815490723, "template": "generated-f0181794-a517-4a28-a91b-a7092a4a8859", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag_question AS tq,
tag AS t,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
answer AS a1
WHERE (q.score > 15 AND q.score > 13 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND tq.question_id = q.id AND tq.site_id = q.site_id AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = q.site_id AND q1.site_id = q.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND tq.site_id = a1.site_id AND t1.site_id = a1.site_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND t.site_id = a1.site_id AND a1.site_id = tq1.site_id AND a1.site_id = q.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id)
