--stack_templates_generated-72167363-89e4-4ae8-8830-2443a5fb9e95_bd213bf0-0991-38c6-b3b7-5409055f44a6.sql
--{"gen": "erase", "time": 1.5072009563446045, "template": "generated-72167363-89e4-4ae8-8830-2443a5fb9e95", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag_question AS tq,
tag AS t,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
question AS q2,
site AS s1,
site AS s2,
so_user AS u2,
question AS q
WHERE (t.name IN ('tables', 'tikz-pgf') AND s1.site_name = 'avp' AND s2.site_name = 'academia' AND q.score > 8 AND q.score >= 0 AND tq.tag_id = t.id AND tq.site_id = u1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.site_id = s2.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND s2.site_id = u2.site_id AND tq.question_id = q.id AND tq.site_id = a1.site_id AND tq.site_id = q.site_id AND u1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND tq.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id)
