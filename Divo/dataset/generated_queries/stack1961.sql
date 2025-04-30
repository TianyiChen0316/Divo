--stack_templates_generated-680ef849-4c6a-4a70-94e2-67b489db981b_09ad6c16-452c-301d-a64b-6303c2ce84f4.sql
--{"gen": "erase", "time": 2.274492025375366, "template": "generated-680ef849-4c6a-4a70-94e2-67b489db981b", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'emacs' AND s2.site_name = 'opendata' AND b1.name = 'Famous Question' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND s2.site_id = u2.site_id)
