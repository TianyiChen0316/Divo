--stack_templates_generated-a3d9e049-27e6-40f0-92fc-c8dbe13673bb_48d84711-ce8d-3a4f-8f43-4989bf7939eb.sql
--{"gen": "erase", "time": 3.219944953918457, "template": "generated-a3d9e049-27e6-40f0-92fc-c8dbe13673bb", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
question AS q2,
so_user AS u2,
tag AS t2,
tag_question AS tq2,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'serverfault' AND t2.name = 'dictionary' AND b1.name = 'Not a Robot' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND u2.account_id = so_user.account_id AND u1.account_id = so_user.account_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
