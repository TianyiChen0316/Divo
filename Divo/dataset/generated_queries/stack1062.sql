--stack_templates_generated-a4d2ddf2-ae4e-4e79-9276-0019a342eb0e_80b90a04-f912-3709-a4ff-6b16242270d2.sql
--{"gen": "erase", "time": 2.4293465614318848, "template": "generated-a4d2ddf2-ae4e-4e79-9276-0019a342eb0e", "dataset": "stack_templates", "rows": 77113}
SELECT *
FROM so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'hsm' AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
