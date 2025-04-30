--stack_templates_generated-b1ab41aa-6348-466f-85b6-ce67250afe83_953af4d7-960d-356c-b944-70120303e288.sql
--{"gen": "erase", "time": 3.0573246479034424, "template": "generated-b1ab41aa-6348-466f-85b6-ce67250afe83", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q2,
site AS s1,
so_user AS u1,
so_user AS u2,
badge AS b1,
so_user AS so_user
WHERE (s1.site_name = 'ebooks' AND b1.name = 'Publicist' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id)
