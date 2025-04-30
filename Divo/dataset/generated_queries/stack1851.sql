--stack_templates_generated-15486fe3-6d9a-4c8d-873a-46728daf3b4e_6b3244b8-1a5f-3955-901a-401cf3a824ae.sql
--{"gen": "combine", "time": 0.5738511085510254, "template": "generated-15486fe3-6d9a-4c8d-873a-46728daf3b4e", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q,
tag AS t,
tag_question AS tq,
account AS account,
comment AS c1,
site AS s1,
question AS q2,
so_user AS u2
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 8 AND q1.score > 5 AND u1.reputation <= 10 AND u1.reputation <= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q.score > 8 AND q.score >= 10 AND t.name IN ('tables', 'tikz-pgf') AND s1.site_name = 'hsm' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND tq.question_id = q.id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = t.site_id AND t1.site_id = q.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND b.site_id = q.site_id AND tq1.site_id = q.site_id AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = c1.site_id AND c1.post_id = a1.question_id AND t1.site_id = c1.site_id AND u1.site_id = s1.site_id AND u1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND tq.site_id = s1.site_id AND tq.site_id = c1.site_id AND t.site_id = s1.site_id AND t.site_id = c1.site_id AND s1.site_id = b.site_id AND s1.site_id = q.site_id AND b.site_id = c1.site_id AND q.site_id = c1.site_id AND c1.score > q1.score)
 order by count(*) desc LIMIT 100