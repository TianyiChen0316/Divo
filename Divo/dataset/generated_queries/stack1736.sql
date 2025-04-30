--stack_templates_generated-58e67bdd-762d-4854-8c2d-797a25a0ae72_a67fc748-78ae-37ad-b25e-9df789125422.sql
--{"gen": "combine", "time": 0.347003698348999, "template": "generated-58e67bdd-762d-4854-8c2d-797a25a0ae72", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
badge AS b1,
so_user AS so_user,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
badge AS b,
site AS s,
tag AS t1
WHERE (account.website_url <> '' AND b1.name = 'Custodian' AND s1.site_name = 'hsm' AND s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND account.id = so_user.account_id AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = a1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = b.site_id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.owner_user_id = b.user_id AND q1.owner_user_id = b.user_id AND t1.site_id = s1.site_id AND s.site_id = s1.site_id AND s1.site_id = b.site_id)
