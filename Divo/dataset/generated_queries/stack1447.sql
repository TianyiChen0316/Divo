--stack_templates_q3-075_6d678f45-df07-38ab-b883-6495f18e8ffd.sql
--{"gen": "erase", "time": 3.824610471725464, "template": "q3-075", "dataset": "stack_templates", "rows": 14971}
SELECT *
FROM answer AS a1,
question AS q1,
question AS q2,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2,
tag_question AS tq1
WHERE (s1.site_name = 'ebooks' AND t2.name = 'iframe' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.question_id = q1.id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id)
