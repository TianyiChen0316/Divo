--stack_templates_58a1f1f8f484dbdfe5801541390866636ee09328_b981816f-6cac-3658-8f07-084e04448a4c.sql
--{"gen": "combine", "time": 1.3823232650756836, "template": "58a1f1f8f484dbdfe5801541390866636ee09328", "dataset": "stack_templates", "rows": 100}
SELECT acc.location,
count(*)
FROM account AS acc,
answer AS a1,
badge AS b,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score > 8 AND q1.score >= 0 AND s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND u1.reputation >= 10 AND u1.reputation >= 0 AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND q1.id = tq1.question_id AND s.site_id = a1.site_id AND s.site_id = b.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id)
 group by acc.location order by count(*) desc LIMIT 100