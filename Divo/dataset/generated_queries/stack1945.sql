--stack_templates_generated-98dac05d-a0fc-470d-93b6-5483da98b497_fff2a488-fdc3-39cd-90d1-cd68394c335d.sql
--{"gen": "combine", "time": 0.6959941387176514, "template": "generated-98dac05d-a0fc-470d-93b6-5483da98b497", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
tag AS t,
badge AS b2,
tag_question AS tq
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score <= 5 AND q1.score > 9 AND u1.reputation <= 100000 AND u1.reputation >= 0 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND t.name IN ('tables', 'tikz-pgf') AND b2.name = 'Custodian' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND t1.site_id = t.site_id AND t.site_id = a1.site_id AND tq.site_id = b2.site_id AND t1.site_id = b2.site_id AND t.site_id = b2.site_id AND b.user_id = q1.owner_user_id AND u1.id = q1.owner_user_id AND q1.owner_user_id = a1.owner_user_id)
 order by count(*) desc LIMIT 100