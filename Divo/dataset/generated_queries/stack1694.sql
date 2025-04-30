--stack_templates_generated-691525b3-e20d-489f-bd7f-defe4660550a_b17f7a40-c506-3eb5-9d0a-bbe8be095452.sql
--{"gen": "combine", "time": 4.468388080596924, "template": "generated-691525b3-e20d-489f-bd7f-defe4660550a", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u2,
question AS q,
tag AS t,
tag_question AS tq
WHERE (s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score >= 1 AND q1.score > 8 AND u1.reputation <= 100 AND u1.reputation >= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s1.site_name = 'ru' AND s2.site_name = 'bicycles' AND q.score >= 1 AND q.score <= 0 AND t.name IN ('tables', 'tikz-pgf') AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = a1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = b.site_id AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q2.site_id = s2.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND u1.site_id = s1.site_id AND s1.site_id = a1.site_id AND s2.site_id = u2.site_id AND t1.site_id = s1.site_id AND s.site_id = s1.site_id AND s1.site_id = b.site_id AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = t.site_id AND t1.site_id = q.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND s1.site_id = q.site_id AND b.site_id = q.site_id AND tq1.site_id = q.site_id)
 order by count(*) desc LIMIT 100