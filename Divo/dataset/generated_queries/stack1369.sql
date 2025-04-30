--stack_templates_generated-2e60b383-340a-4d21-80d0-6a8ceef992bd_46868e9e-5a19-3087-b6fd-e2846542f52e.sql
--{"gen": "combine", "time": 4.816462755203247, "template": "generated-2e60b383-340a-4d21-80d0-6a8ceef992bd", "dataset": "stack_templates", "rows": 24443}
SELECT *
FROM so_user AS u1,
account AS account,
answer AS a1,
so_user AS u2,
tag AS t2,
badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (t2.name = 'iframe' AND b1.name = 'Reversal' AND b2.name = 'Research Assistant' AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND so_user.account_id = u1.account_id AND account.id = u2.account_id AND account.id = so_user.account_id AND u2.account_id = so_user.account_id AND t2.site_id = u2.site_id AND b2.date > b1.date + '11 months'::interval)
