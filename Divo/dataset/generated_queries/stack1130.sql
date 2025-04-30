--stack_templates_generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322_3d7fd607-574a-30f5-8010-e6dc45926873.sql
--{"gen": "erase", "time": 2.868774175643921, "template": "generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322", "dataset": "stack_templates", "rows": 3001}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'API Evangelist' AND b2.name = 'Famous Question' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
