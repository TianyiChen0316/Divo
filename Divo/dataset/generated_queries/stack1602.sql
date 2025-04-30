--stack_templates_generated-b598911c-104c-4b3b-b46a-3d989a19aadb_107b6555-6a05-31d1-a8a2-b97ece68e582.sql
--{"gen": "erase", "time": 0.24051380157470703, "template": "generated-b598911c-104c-4b3b-b46a-3d989a19aadb", "dataset": "stack_templates", "rows": 4}
SELECT *
FROM badge AS b1,
badge AS b2,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1
WHERE (b1.name = 'Legendary' AND b2.name = 'Lifeboat' AND q1.favorite_count >= 0 AND q1.favorite_count >= 0 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND t1.site_id = u1.site_id AND t1.site_id = b1.site_id AND t1.site_id = q1.site_id AND t1.site_id = b2.site_id AND t1.site_id = tq1.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
