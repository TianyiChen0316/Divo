--stack_templates_generated-cf862794-02ba-47c9-82d4-308e5fc60b9a_6d204ed3-4236-3101-9aa5-44ff6d109bdc.sql
--{"gen": "combine", "time": 4.678327560424805, "template": "generated-cf862794-02ba-47c9-82d4-308e5fc60b9a", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
badge AS b1,
badge AS b2,
tag AS t,
tag_question AS tq,
tag AS t1
WHERE (q1.score > 5 AND q1.score > 5 AND u1.reputation >= 0 AND u1.reputation >= 0 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b1.name = 'Reversal' AND b2.name = 'Synonymizer' AND t.name IN ('tables', 'tikz-pgf') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND b1.user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b1.user_id = a1.owner_user_id AND tq.tag_id = t.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND tq.site_id = b1.site_id AND tq.site_id = b2.site_id AND t1.site_id = b1.site_id AND t1.site_id = b2.site_id AND b1.site_id = t.site_id AND t.site_id = b2.site_id AND b2.date > b1.date + '11 months'::interval)
 order by count(*) desc LIMIT 100