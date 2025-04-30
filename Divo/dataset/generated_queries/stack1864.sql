--stack_templates_generated-6d6a3262-cefb-4787-ba11-908a2216a164_891484e8-bf1d-34c6-9917-3a7ae35a2c8c.sql
--{"gen": "erase", "time": 1.6355783939361572, "template": "generated-6d6a3262-cefb-4787-ba11-908a2216a164", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
comment AS c1
WHERE (s1.site_name = 'dba' AND s2.site_name = 'drupal' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND u1.site_id = c1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND c1.score > q1.score)
