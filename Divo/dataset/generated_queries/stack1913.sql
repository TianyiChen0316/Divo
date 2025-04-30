--stack_templates_58a1f1f8f484dbdfe5801541390866636ee09328_89ab6732-82cd-3cb4-a4ff-c1613aba2196.sql
--{"gen": "combine", "time": 4.8705291748046875, "template": "58a1f1f8f484dbdfe5801541390866636ee09328", "dataset": "stack_templates", "rows": 16}
SELECT acc.location,
count(*)
FROM account AS acc,
answer AS a1,
badge AS b,
question AS q1,
site AS s,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS account,
site AS s1,
so_user AS u2,
tag AS t2
WHERE (b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND q1.score > 9 AND q1.score > 11 AND s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND t1.name IN ('adobe-illustrator', 'adobe-photoshop', 'c#', 'google-sheets', 'graduate-school', 'marvel', 'star-trek', 'story-identification') AND u1.reputation >= 0 AND u1.reputation <= 100 AND s1.site_name = 'scifi' AND t2.name = 'scope' AND a1.owner_user_id = u1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND q1.id = a1.question_id AND q1.id = tq1.question_id AND s.site_id = a1.site_id AND s.site_id = b.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND t1.id = tq1.tag_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND t2.site_id = u2.site_id AND account.id = acc.id AND acc.id = u2.account_id AND tq1.question_id = a1.question_id AND b.user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND s.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = a1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = a1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND b.site_id = tq1.site_id)
 group by acc.location order by count(*) desc LIMIT 100