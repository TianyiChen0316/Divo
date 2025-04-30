--stack_templates_generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2_e82908b3-e169-3c9e-acdb-73fc3c37a71c.sql
--{"gen": "combine", "time": 0.8168408870697021, "template": "generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
question AS q1,
question AS q,
tag AS t,
tag_question AS tq,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'Documentation Pioneer' AND s1.site_name = 'linguistics' AND q.score > 14 AND q.score <= 10 AND t.name IN ('tables', 'tikz-pgf') AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND u1.site_id = q1.site_id AND q1.site_id = tq1.site_id AND tq.question_id = q.id AND tq.tag_id = t.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = q.site_id AND u1.site_id = t.site_id AND u1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = q.site_id AND t.site_id = a1.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND a1.site_id = q.site_id AND tq1.site_id = q.site_id AND tq.site_id = s1.site_id AND t1.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
