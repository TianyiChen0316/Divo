--stack_templates_generated-798395bc-29c4-4107-abd2-1c2286ac1040_420aa033-f978-3355-84b8-286e4bd37984.sql
--{"gen": "erase", "time": 0.12398242950439453, "template": "generated-798395bc-29c4-4107-abd2-1c2286ac1040", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
tag AS t,
tag_question AS tq
WHERE (s1.site_name = 'patents' AND s2.site_name = 'music' AND t.name IN ('tables', 'tikz-pgf') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq.tag_id = t.id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = tq1.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND tq.site_id = s1.site_id AND t.site_id = s1.site_id)
