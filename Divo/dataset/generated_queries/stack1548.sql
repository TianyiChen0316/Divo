--stack_templates_generated-28f63b18-c43a-4941-b30a-0e822ccab6a5_a86ca3b2-e686-3f98-a543-355aff0e70e1.sql
--{"gen": "combine", "time": 2.4612553119659424, "template": "generated-28f63b18-c43a-4941-b30a-0e822ccab6a5", "dataset": "stack_templates", "rows": 2}
SELECT DISTINCT account.display_name
FROM account AS account,
question AS q1,
question AS q2,
so_user AS u1,
so_user AS u2,
tag AS t1,
tag AS t2,
tag_question AS tq1,
so_user AS so_user,
site AS s1
WHERE (t1.name = 'rust' AND t2.name = 'proof-verification' AND s1.site_name = 'softwareengineering' AND tq1.question_id = q1.id AND tq1.tag_id = t1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u1.site_id = t1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND t1.site_id = s1.site_id)
