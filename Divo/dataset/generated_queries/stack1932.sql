--stack_templates_generated-d1a2b766-577d-4552-9340-24a02df002b2_a0ae0920-6481-3396-9249-69d933eb666d.sql
--{"gen": "combine", "time": 0.5980021953582764, "template": "generated-d1a2b766-577d-4552-9340-24a02df002b2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
comment AS c1,
site AS s1
WHERE (s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score >= 10 AND q1.score > 9 AND u1.reputation <= 100000 AND u1.reputation <= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s1.site_name = 'chemistry' AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = a1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = b.site_id AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.post_id = tq1.question_id AND c1.site_id = u1.site_id AND c1.site_id = s1.site_id AND c1.site_id = tq1.site_id AND u1.site_id = s1.site_id AND t1.site_id = s1.site_id AND t1.site_id = c1.site_id AND s.site_id = s1.site_id AND s.site_id = c1.site_id AND a1.site_id = s1.site_id AND a1.site_id = c1.site_id AND s1.site_id = b.site_id AND b.site_id = c1.site_id AND c1.post_id = a1.question_id AND c1.score > q1.score)
 order by count(*) desc LIMIT 100