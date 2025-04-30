--stack_templates_generated-24e0d1db-0d35-40e6-bc00-76888ecb5a0d_5109bee4-6f63-3d25-91dc-474bebd14be8.sql
--{"gen": "erase", "time": 0.2633652687072754, "template": "generated-24e0d1db-0d35-40e6-bc00-76888ecb5a0d", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
account AS acc,
answer AS a1,
badge AS b,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'Synonymizer' AND s1.site_name = 'linguistics' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND t1.id = tq1.tag_id AND account.id = acc.id AND so_user.account_id = acc.id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id)
