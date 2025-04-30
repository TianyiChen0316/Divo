--stack_templates_generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322_e0ae1e5e-2109-344a-835b-3080d9d7c36e.sql
--{"gen": "erase", "time": 4.85652232170105, "template": "generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322", "dataset": "stack_templates", "rows": 13448}
SELECT *
FROM badge AS b1,
so_user AS so_user,
account AS account,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'Illuminator' AND account.website_url <> '' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
