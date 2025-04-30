--stack_templates_generated-98dac05d-a0fc-470d-93b6-5483da98b497_b38613f3-0948-3e60-ac3e-5314ceaf7383.sql
--{"gen": "combine", "time": 0.34229278564453125, "template": "generated-98dac05d-a0fc-470d-93b6-5483da98b497", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
badge AS b1,
so_user AS so_user,
site AS s1
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 13 AND q1.score > 11 AND u1.reputation <= 100000 AND u1.reputation <= 100 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.website_url <> '' AND b1.name = 'Documentation Beta' AND s1.site_name = 'wordpress' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND t1.site_id = s1.site_id AND a1.site_id = s1.site_id AND s1.site_id = b.site_id)
 order by count(*) desc LIMIT 100