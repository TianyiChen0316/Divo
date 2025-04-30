--stack_templates_generated-d2426ce5-a491-443d-95b0-5d50519da91f_a2125a0b-4e68-38d2-a287-d5cfb9157522.sql
--{"gen": "combine", "time": 0.323866605758667, "template": "generated-d2426ce5-a491-443d-95b0-5d50519da91f", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM tag AS t,
tag_question AS tq,
answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
site AS s1,
badge AS b1,
so_user AS so_user
WHERE (t.name IN ('tables', 'tikz-pgf') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score > 6 AND q1.score > 5 AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND u1.reputation <= 100000 AND u1.reputation >= 10 AND s1.site_name = 'outdoors' AND tq.tag_id = t.id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND q1.id = a1.question_id AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND tq.site_id = t1.site_id AND tq.site_id = u1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = a1.site_id AND tq.site_id = b.site_id AND tq.site_id = tq1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = t.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = t.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND t.site_id = a1.site_id AND t.site_id = b.site_id AND t.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id AND tq1.site_id = s1.site_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND b1.user_id = u1.id AND tq.site_id = b1.site_id AND u1.site_id = b1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND a1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND so_user.id = u1.id AND so_user.id = a1.owner_user_id AND b1.user_id = a1.owner_user_id AND tq.site_id = so_user.site_id AND tq.site_id = s1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = a1.site_id AND b1.site_id = s1.site_id AND t.site_id = so_user.site_id AND t.site_id = s1.site_id AND so_user.site_id = a1.site_id AND so_user.site_id = s1.site_id AND so_user.site_id = tq1.site_id AND so_user.id = b.user_id AND b.user_id = b1.user_id AND t1.site_id = b1.site_id AND t1.site_id = so_user.site_id AND t1.site_id = s1.site_id AND b1.site_id = q1.site_id AND b1.site_id = b.site_id AND q1.site_id = so_user.site_id AND q1.site_id = s1.site_id AND so_user.site_id = b.site_id AND s1.site_id = b.site_id)
