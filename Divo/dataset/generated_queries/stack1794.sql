--stack_templates_generated-b7cefcac-bb1e-41f7-b54e-708a3cb74dbf_5085679b-35c2-3196-a290-460cb28ccf1c.sql
--{"gen": "combine", "time": 3.05487322807312, "template": "generated-b7cefcac-bb1e-41f7-b54e-708a3cb74dbf", "dataset": "stack_templates", "rows": 33988}
SELECT *
FROM badge AS b1,
so_user AS so_user,
account AS account,
question AS q1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
badge AS b,
site AS s,
tag AS t1
WHERE (b1.name = 'Nice Question' AND account.website_url <> '' AND s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND account.id = so_user.account_id AND account.id = u1.account_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND so_user.account_id = u1.account_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = a1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = b.site_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = a1.site_id AND t1.site_id = a1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = a1.owner_user_id)
