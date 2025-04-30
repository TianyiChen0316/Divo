--stack_templates_generated-30d5a38e-5d24-4b47-bbb9-2434f8aa740d_eb46b142-729a-3f8d-aa03-6c547056315f.sql
--{"gen": "erase", "time": 2.4394445419311523, "template": "generated-30d5a38e-5d24-4b47-bbb9-2434f8aa740d", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
badge AS b1,
so_user AS so_user,
tag AS t1
WHERE (s1.site_name = 'softwareengineering' AND b1.name = 'Custodian' AND t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t1.id = tq1.tag_id AND u1.site_id = t1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id)
