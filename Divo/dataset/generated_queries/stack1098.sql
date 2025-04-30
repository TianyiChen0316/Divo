--stack_templates_generated-a4d2ddf2-ae4e-4e79-9276-0019a342eb0e_a3b58c98-0a8b-3146-adcb-842ab86d11c5.sql
--{"gen": "erase", "time": 2.789902448654175, "template": "generated-a4d2ddf2-ae4e-4e79-9276-0019a342eb0e", "dataset": "stack_templates", "rows": 6}
SELECT *
FROM badge AS b1,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1
WHERE (b1.name = 'Documentation Pioneer' AND s1.site_name = 'patents' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id)
