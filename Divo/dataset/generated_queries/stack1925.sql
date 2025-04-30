--stack_templates_generated-14cc2e3c-2812-4434-ab6c-5d95f852914c_0c714995-bdff-38ef-bdcc-e6962a49cbab.sql
--{"gen": "erase", "time": 2.639568567276001, "template": "generated-14cc2e3c-2812-4434-ab6c-5d95f852914c", "dataset": "stack_templates", "rows": 1170}
SELECT *
FROM badge AS b1,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Epic' AND s1.site_name = 'apple' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
