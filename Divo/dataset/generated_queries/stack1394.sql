--stack_templates_58a1f1f8f484dbdfe5801541390866636ee09328_5dfdefc2-de99-344b-a899-83d1684d77df.sql
--{"gen": "erase", "time": 3.3384649753570557, "template": "58a1f1f8f484dbdfe5801541390866636ee09328", "dataset": "stack_templates", "rows": 100}
SELECT acc.location,
count(*)
FROM account AS acc,
answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 13 AND q1.score >= 1 AND u1.reputation >= 10 AND u1.reputation <= 100 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND acc.id = u1.account_id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id)
 group by acc.location order by count(*) desc LIMIT 100