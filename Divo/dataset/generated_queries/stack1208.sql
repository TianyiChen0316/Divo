--stack_templates_58a1f1f8f484dbdfe5801541390866636ee09328_4b63182d-e411-3dff-9b18-b00ec76e44ab.sql
--{"gen": "erase", "time": 1.2315971851348877, "template": "58a1f1f8f484dbdfe5801541390866636ee09328", "dataset": "stack_templates", "rows": 25}
SELECT acc.location,
count(*)
FROM account AS acc,
badge AS b,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 8 AND q1.score > 14 AND u1.reputation >= 10 AND u1.reputation <= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = b.site_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND acc.id = u1.account_id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by acc.location order by count(*) desc LIMIT 100