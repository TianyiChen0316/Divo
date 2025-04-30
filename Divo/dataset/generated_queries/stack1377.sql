--stack_templates_generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322_e086c3ae-33c2-3fda-95c3-a209c7b873ff.sql
--{"gen": "erase", "time": 2.9683566093444824, "template": "generated-fbb1709c-85fc-43fa-9e0a-65ee4b10a322", "dataset": "stack_templates", "rows": 2329}
SELECT *
FROM badge AS b1,
so_user AS so_user,
account AS account,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'API Evangelist' AND account.website_url <> '' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
