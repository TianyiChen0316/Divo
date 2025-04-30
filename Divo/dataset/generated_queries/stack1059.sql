--stack_templates_generated-14cc2e3c-2812-4434-ab6c-5d95f852914c_d8d40ba6-f9b8-3760-b702-0cbc7926f2ac.sql
--{"gen": "erase", "time": 4.820886611938477, "template": "generated-14cc2e3c-2812-4434-ab6c-5d95f852914c", "dataset": "stack_templates", "rows": 149339}
SELECT *
FROM badge AS b1,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Nice Question' AND s1.site_name = 'opendata' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
