--stack_templates_generated-3c0db064-4cd2-47c7-9b8f-b0dfc84abfcd_da301cbf-fd62-3082-bab8-248f1c38f3f6.sql
--{"gen": "combine", "time": 0.2022547721862793, "template": "generated-3c0db064-4cd2-47c7-9b8f-b0dfc84abfcd", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
answer AS a1
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 7 AND q1.score <= 0 AND u1.reputation <= 100000 AND u1.reputation <= 100 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND t.name IN ('tables', 'tikz-pgf') AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND q1.id = a1.question_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id)
 order by count(*) desc LIMIT 100