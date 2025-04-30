--stack_templates_generated-d1a2b766-577d-4552-9340-24a02df002b2_e652bef6-d109-33f9-af6b-3defd5997b60.sql
--{"gen": "erase", "time": 2.6580657958984375, "template": "generated-d1a2b766-577d-4552-9340-24a02df002b2", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 6 AND q1.score <= 5 AND u1.reputation <= 100000 AND u1.reputation >= 0 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 order by count(*) desc LIMIT 100