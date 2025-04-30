--stack_templates_generated-6df87bb3-dbbd-4ac2-b500-95eb29ce5bf5_207850d4-a860-36cf-af99-14980e0a7b17.sql
--{"gen": "erase", "time": 1.6309003829956055, "template": "generated-6df87bb3-dbbd-4ac2-b500-95eb29ce5bf5", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
site AS s2,
so_user AS u2,
tag_question AS tq2
WHERE (t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count <= 10000 AND q1.favorite_count >= 5 AND t1.name IN ('abstract-class', 'ado.net', 'concatenation', 'duplicates', 'passport.js', 'screen', 'xcode5') AND s2.site_name = 'lifehacks' AND tq.tag_id = t.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND t.site_id = tq1.site_id AND tq.site_id = t.site_id AND tq2.site_id = s2.site_id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND tq2.site_id = u2.site_id)
