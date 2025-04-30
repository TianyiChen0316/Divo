--stack_templates_q8-030_52010df7-0ea4-3bb5-bde9-a85a8332850d.sql
--{"gen": "combine", "time": 0.2777745723724365, "template": "q8-030", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
site AS site,
tag_question AS tq1,
tag_question AS tq2,
site AS s1,
so_user AS u1,
account AS account,
answer AS a1,
so_user AS u2
WHERE (site.site_name = 'superuser' AND s1.site_name = 'money' AND account.website_url <> '' AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND pl.site_id = site.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND tq1.tag_id = tq2.tag_id AND tq2.site_id = c2.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = a1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = u1.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = s1.site_id AND c2.site_id = tq1.site_id AND c2.site_id = a1.site_id AND c2.site_id = c1.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND u1.site_id = c1.site_id AND q1.site_id = site.site_id AND q1.site_id = q2.site_id AND site.site_id = q2.site_id AND site.site_id = s1.site_id AND site.site_id = tq1.site_id AND site.site_id = a1.site_id AND site.site_id = c1.site_id AND pl.site_id = s1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = a1.site_id AND pl.site_id = c1.site_id AND q2.site_id = s1.site_id AND q2.site_id = tq1.site_id AND q2.site_id = a1.site_id AND q2.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND a1.site_id = c1.site_id AND tq1.question_id = pl.post_id_from AND tq1.question_id = c1.post_id AND a1.question_id = pl.post_id_from AND a1.question_id = c1.post_id AND pl.post_id_from = c1.post_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND c1.date < c2.date)
