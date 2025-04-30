--stack_templates_generated-3db4a050-7a79-4800-9b58-e1a2e03f26b7_70808e9b-0ed9-355a-84d3-ba6c9a616f9f.sql
--{"gen": "erase", "time": 1.813899278640747, "template": "generated-3db4a050-7a79-4800-9b58-e1a2e03f26b7", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
so_user AS u1,
tag_question AS tq1,
badge AS b1,
badge AS b2
WHERE (u1.reputation <= 100 AND u1.reputation <= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b1.name = 'Constable' AND b2.name = 'Legendary' AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND b1.user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b1.user_id = a1.owner_user_id AND b2.date > b1.date + '11 months'::interval)
 order by count(*) desc LIMIT 100