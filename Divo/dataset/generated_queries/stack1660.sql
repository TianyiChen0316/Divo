--stack_templates_generated-57613c53-f2ba-4b42-95fa-8116fa1cea46_726430b1-44e5-3cea-83ab-aac4b5dd8c18.sql
--{"gen": "combine", "time": 0.20591998100280762, "template": "generated-57613c53-f2ba-4b42-95fa-8116fa1cea46", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q2,
so_user AS u2,
tag AS t2,
tag_question AS tq2,
tag AS t,
tag_question AS tq,
badge AS b1,
site AS s
WHERE (s1.site_name = 'health' AND t1.name = 'deployment' AND t2.name = 'geometry' AND t.name IN ('tables', 'tikz-pgf') AND s.site_name IN ('askubuntu', 'math') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND tq.tag_id = t.id AND b1.user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = t.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND q1.site_id = t.site_id AND t.site_id = tq1.site_id AND b1.user_id = q1.owner_user_id AND tq.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id AND tq.site_id = t1.site_id AND tq.site_id = a1.site_id AND t1.site_id = b1.site_id AND t1.site_id = t.site_id AND b1.site_id = a1.site_id AND t.site_id = a1.site_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND s.site_id = t1.site_id AND tq.site_id = s.site_id AND s.site_id = b1.site_id AND s.site_id = t.site_id AND s.site_id = a1.site_id AND s.site_id = s1.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
