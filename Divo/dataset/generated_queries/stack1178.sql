--stack_templates_generated-7a9e4e83-89f5-4394-89ae-75aebc380b2d_fbf69b6e-722b-3980-bac4-18eff24d25fc.sql
--{"gen": "combine", "time": 3.971242904663086, "template": "generated-7a9e4e83-89f5-4394-89ae-75aebc380b2d", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 7 AND q1.score > 12 AND u1.reputation <= 100000 AND u1.reputation >= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.website_url <> '' AND b1.name = 'Reversal' AND b2.name = 'API Evangelist' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND t1.site_id = b1.site_id AND t1.site_id = b2.site_id AND t1.site_id = so_user.site_id AND u1.site_id = b1.site_id AND u1.site_id = b2.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b1.site_id = a1.site_id AND b1.site_id = b.site_id AND a1.site_id = so_user.site_id AND a1.site_id = b2.site_id AND so_user.site_id = b.site_id AND b2.site_id = b.site_id AND so_user.id = b.user_id AND so_user.id = a1.owner_user_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id AND b.user_id = b1.user_id AND b1.user_id = a1.owner_user_id AND b2.date > b1.date + '11 months'::interval)
 order by count(*) desc LIMIT 100