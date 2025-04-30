--stack_templates_generated-62a57127-091e-4ebd-b663-e6a5cd2643b0_e758afda-9ce7-323c-a9a2-3126e81e0290.sql
--{"gen": "combine", "time": 4.930466413497925, "template": "generated-62a57127-091e-4ebd-b663-e6a5cd2643b0", "dataset": "stack_templates", "rows": 170}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag_question AS tq1,
tag AS t1
WHERE (b1.name = 'Legendary' AND b2.name = 'Caucus' AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
