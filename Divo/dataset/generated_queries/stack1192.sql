--stack_templates_q2-016_f1bc7db6-f6f4-34f2-9754-4a054f3b7e3d.sql
--{"gen": "erase", "time": 1.3202459812164307, "template": "q2-016", "dataset": "stack_templates", "rows": 97}
SELECT DISTINCT account.display_name
FROM account AS account,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag_question AS tq1,
tag_question AS tq2
WHERE (s1.site_name = 'askubuntu' AND t1.name = 'dual-boot' AND s2.site_name = 'bicycles' AND t1.site_id = s1.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq2.site_id = s2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = t1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = u2.site_id)
