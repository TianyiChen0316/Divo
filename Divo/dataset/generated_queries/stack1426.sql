--stack_templates_generated-7bcf888b-5baf-4b1a-ad32-d7f280da3e8e_81b3a106-95f3-3c61-9942-3cf6b64dcefe.sql
--{"gen": "combine", "time": 0.49919629096984863, "template": "generated-7bcf888b-5baf-4b1a-ad32-d7f280da3e8e", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s1,
account AS account,
account AS acc,
answer AS a1,
so_user AS so_user
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 15 AND q1.score >= 10 AND u1.reputation <= 100 AND u1.reputation <= 100 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s1.site_name = 'german' AND account.website_url <> '' AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND u1.site_id = s1.site_id AND account.id = u1.account_id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND q1.id = a1.question_id AND account.id = acc.id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND s1.site_id = tq1.site_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = b.user_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND account.id = so_user.account_id AND so_user.account_id = u1.account_id AND acc.id = so_user.account_id)
 order by count(*) desc LIMIT 100