--stack_templates_generated-3c0db064-4cd2-47c7-9b8f-b0dfc84abfcd_8aa52792-7cea-36c4-897d-95b4ddfd29aa.sql
--{"gen": "combine", "time": 0.22748541831970215, "template": "generated-3c0db064-4cd2-47c7-9b8f-b0dfc84abfcd", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b,
question AS q1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
site AS s1,
account AS account,
account AS acc,
answer AS a1
WHERE (t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND q1.score > 13 AND q1.score > 7 AND u1.reputation >= 10 AND u1.reputation <= 100000 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s1.site_name = 'hermeneutics' AND account.website_url <> '' AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = t1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = t1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND u1.site_id = s1.site_id AND account.id = u1.account_id AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND q1.id = a1.question_id AND account.id = acc.id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND s1.site_id = tq1.site_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = b.user_id AND t1.site_id = a1.site_id AND t1.site_id = s1.site_id)
 order by count(*) desc LIMIT 100