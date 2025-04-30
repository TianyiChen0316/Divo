--stack_templates_generated-f0131dbe-f4c6-4fcc-b2aa-1fedaf0776eb_8580eaf2-afc1-3a81-9428-3bba1773e0fa.sql
--{"gen": "erase", "time": 2.524909734725952, "template": "generated-f0131dbe-f4c6-4fcc-b2aa-1fedaf0776eb", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2
WHERE (account.website_url <> '' AND s1.site_name = 'ebooks' AND account.id = so_user.account_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id)
