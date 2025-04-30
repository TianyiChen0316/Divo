--stack_templates_generated-5e9786ca-798e-4ad0-9741-9ca9ef1f0917_0c714995-bdff-38ef-bdcc-e6962a49cbab.sql
--{"gen": "combine", "time": 0.29338788986206055, "template": "generated-5e9786ca-798e-4ad0-9741-9ca9ef1f0917", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
badge AS b2,
account AS account,
badge AS b1,
so_user AS so_user
WHERE (acc.website_url ILIKE '%in' AND q1.favorite_count <= 5000 AND q1.favorite_count <= 10 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b2.name = 'Lifeboat' AND account.website_url <> '' AND b1.name = 'Epic' AND acc.id = u1.account_id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = b2.site_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND t1.site_id = b1.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b1.user_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
