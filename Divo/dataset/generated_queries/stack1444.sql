--stack_templates_generated-5d562e12-87d3-4ce2-9bcf-d98c7ce9f1d1_5dfdefc2-de99-344b-a899-83d1684d77df.sql
--{"gen": "combine", "time": 2.7724716663360596, "template": "generated-5d562e12-87d3-4ce2-9bcf-d98c7ce9f1d1", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
badge AS b2,
tag_question AS tq,
tag AS t1
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score > 10 AND q1.score >= 10 AND u1.reputation <= 10 AND u1.reputation >= 10 AND b2.name = 'Not a Robot' AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND b.user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND b.site_id = tq1.site_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.site_id = a1.site_id AND u1.site_id = a1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND tq.tag_id = t.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND t.site_id = a1.site_id AND tq.site_id = b2.site_id AND t1.site_id = b2.site_id AND t.site_id = b2.site_id AND b.user_id = q1.owner_user_id AND u1.id = q1.owner_user_id)
