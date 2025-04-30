--stack_templates_generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2_b09ff055-2f5f-33b7-a64b-4ce65cbebe12.sql
--{"gen": "combine", "time": 1.3703691959381104, "template": "generated-b3a059d6-ad3e-46ee-a136-ce7f2ba016a2", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
so_user AS so_user,
site AS s1,
so_user AS u1,
tag_question AS tq1,
so_user AS u2,
question AS q1,
comment AS c1,
comment AS c2,
post_link AS pl,
question AS q2,
site AS site,
tag_question AS tq2
WHERE (account.website_url <> '' AND s1.site_name = 'serverfault' AND site.site_name = 'vegetarianism' AND account.id = so_user.account_id AND account.id = u1.account_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND q1.site_id = s1.site_id AND tq1.question_id = q1.id AND u1.site_id = q1.site_id AND q1.site_id = tq1.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND pl.site_id = site.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND tq1.tag_id = tq2.tag_id AND tq2.site_id = c2.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = u1.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = s1.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND u1.site_id = c1.site_id AND q1.site_id = site.site_id AND q1.site_id = q2.site_id AND site.site_id = s1.site_id AND site.site_id = q2.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND pl.site_id = s1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND s1.site_id = q2.site_id AND s1.site_id = c1.site_id AND q2.site_id = tq1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = pl.post_id_from AND tq1.question_id = c1.post_id AND pl.post_id_from = c1.post_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
