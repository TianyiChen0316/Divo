--stack_templates_generated-a37bae6e-1ac8-49cd-b651-edaf356cbefb_42456171-a65b-3de7-a14a-6228f034bf7f.sql
--{"gen": "erase", "time": 0.26859521865844727, "template": "generated-a37bae6e-1ac8-49cd-b651-edaf356cbefb", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
answer AS a1,
badge AS b
WHERE (s1.site_name = 'cstheory' AND t1.name IN ('copyright', 'sunyata') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND account.id = acc.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = a1.site_id AND u1.site_id = s1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = b.site_id AND s1.site_id = c1.site_id AND b.site_id = tq1.site_id AND b.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND tq1.question_id = a1.question_id AND c1.post_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND c1.score > q1.score)
