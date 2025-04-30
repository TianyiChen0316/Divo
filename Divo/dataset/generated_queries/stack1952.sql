--stack_templates_generated-6aaa22d8-fb47-493d-8b2b-4b287175bac6_22ca97db-8317-3b04-a654-72de5a813886.sql
--{"gen": "erase", "time": 0.6574606895446777, "template": "generated-6aaa22d8-fb47-493d-8b2b-4b287175bac6", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
question AS q2,
so_user AS u2,
tag AS t2,
tag_question AS tq2,
post_link AS pl
WHERE (s1.site_name = 'avp' AND t2.name = 'python' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND u1.site_id = pl.site_id AND pl.site_id = s1.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = a1.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = tq1.site_id AND t2.site_id = u1.site_id AND t2.site_id = a1.site_id AND t2.site_id = pl.site_id AND t2.site_id = s1.site_id AND t2.site_id = tq1.site_id AND u1.site_id = u2.site_id AND u1.site_id = q2.site_id AND u2.site_id = a1.site_id AND u2.site_id = pl.site_id AND u2.site_id = s1.site_id AND u2.site_id = tq1.site_id AND a1.site_id = pl.site_id AND a1.site_id = q2.site_id AND s1.site_id = q2.site_id AND q2.site_id = tq1.site_id AND a1.question_id = pl.post_id_from AND tq2.tag_id = tq1.tag_id AND t2.id = tq1.tag_id)
