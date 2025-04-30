--stack_templates_generated-61315cd2-77bb-4295-bc2e-fc57a7926a34_d049089b-dfd9-3018-85fe-b8c7cd5ca3cd.sql
--{"gen": "erase", "time": 1.58056640625, "template": "generated-61315cd2-77bb-4295-bc2e-fc57a7926a34", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM account AS acc,
badge AS b1,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
so_user AS u2,
tag AS t2
WHERE (acc.website_url ILIKE '%io' AND q1.favorite_count <= 10000 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND t2.name = 'flutter' AND acc.id = u1.account_id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u2.account_id = account.id AND t2.site_id = u2.site_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND account.id = acc.id AND acc.id = u2.account_id AND b1.user_id = q1.owner_user_id)
