--stack_templates_generated-21f9947d-ff31-4733-9727-6167aefea9d7_5b8ba856-c4c2-3c5a-8dbb-6f7633a00a78.sql
--{"gen": "combine", "time": 2.259829044342041, "template": "generated-21f9947d-ff31-4733-9727-6167aefea9d7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q,
tag AS t,
tag_question AS tq,
so_user AS so_user,
site AS s1,
badge AS b1
WHERE (s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score >= 0 AND q1.score <= 10 AND u1.reputation <= 100 AND u1.reputation <= 100000 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q.score <= 0 AND q.score >= 10 AND t.name IN ('tables', 'tikz-pgf') AND s1.site_name = 'datascience' AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = a1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = b.site_id AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND q.site_id = s.site_id AND t.site_id = s.site_id AND tq.question_id = q.id AND tq.site_id = s.site_id AND tq.tag_id = t.id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = t.site_id AND t1.site_id = q.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND b.site_id = q.site_id AND tq1.site_id = q.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND t1.site_id = s1.site_id AND s.site_id = s1.site_id AND t.site_id = s1.site_id AND a1.site_id = s1.site_id AND s1.site_id = b.site_id AND s1.site_id = q.site_id AND b1.user_id = u1.id AND tq.site_id = b1.site_id AND t1.site_id = b1.site_id AND u1.site_id = b1.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND s.site_id = b1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND b1.site_id = b.site_id AND b1.user_id = b.user_id AND b1.user_id = a1.owner_user_id AND b.user_id = q1.owner_user_id AND u1.id = q1.owner_user_id AND q1.owner_user_id = a1.owner_user_id)
 order by count(*) desc LIMIT 100