--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_312ef8e1-2f7a-3751-81cc-9bb281eee69b.sql
--{"gen": "erase", "time": 0.22324204444885254, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 2}
SELECT *
FROM answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
question AS q2,
so_user AS u2,
tag AS t2,
tag_question AS tq2
WHERE (s1.site_name = 'hsm' AND t2.name = 'deployment' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
