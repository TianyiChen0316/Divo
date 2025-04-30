--stack_templates_generated-b47c4092-5a56-448f-a0b6-bafc4783a8bf_c97899db-eeda-3a8d-8bfa-f0316853844e.sql
--{"gen": "erase", "time": 0.10855650901794434, "template": "generated-b47c4092-5a56-448f-a0b6-bafc4783a8bf", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
site AS s1,
so_user AS u1,
tag_question AS tq1,
tag AS t,
tag_question AS tq,
badge AS b1,
answer AS a1,
badge AS b2
WHERE (s1.site_name = 'philosophy' AND t.name IN ('tables', 'tikz-pgf') AND b2.name = 'API Evangelist' AND tq1.site_id = s1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b1.user_id = a1.owner_user_id AND tq.site_id = a1.site_id AND tq.site_id = s1.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = a1.owner_user_id AND tq.site_id = b2.site_id AND u1.site_id = b2.site_id AND t.site_id = b2.site_id AND a1.site_id = b2.site_id AND s1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND b2.date > b1.date + '11 months'::interval)
