--stack_templates_generated-2cb50983-99d8-4ae1-ac29-84a038c5d308_d2eeef8a-8075-302c-80bc-9838b001ee7a.sql
--{"gen": "erase", "time": 2.690721273422241, "template": "generated-2cb50983-99d8-4ae1-ac29-84a038c5d308", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
badge AS b2,
tag AS t1
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score > 5 AND q1.score > 8 AND u1.reputation <= 10 AND u1.reputation <= 100 AND b2.name = 'Documentation Pioneer' AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND b.user_id = u1.id AND q1.id = tq1.question_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND b.site_id = tq1.site_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.site_id = a1.site_id AND u1.site_id = a1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND t.site_id = a1.site_id AND t1.site_id = b2.site_id AND t.site_id = b2.site_id AND b.user_id = q1.owner_user_id AND u1.id = q1.owner_user_id)
