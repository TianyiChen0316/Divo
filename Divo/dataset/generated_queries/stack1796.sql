--stack_templates_generated-0d49eeee-7ab6-4291-ac8d-05356b64da69_84d3221a-93f4-3aaf-94ba-d31a661be399.sql
--{"gen": "combine", "time": 0.2679417133331299, "template": "generated-0d49eeee-7ab6-4291-ac8d-05356b64da69", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2,
tag AS t1,
account AS account,
comment AS c1
WHERE (t.name IN ('tables', 'tikz-pgf') AND s1.site_name = 'buddhism' AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.owner_user_id = a1.owner_user_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND t1.site_id = t.site_id AND u1.site_id = t.site_id AND q1.site_id = t.site_id AND t.site_id = a1.site_id AND t.site_id = s1.site_id AND t.site_id = tq1.site_id AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND account.id = u2.account_id AND t1.site_id = c1.site_id AND u1.site_id = c1.site_id AND t.site_id = c1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND c1.score > q1.score)
