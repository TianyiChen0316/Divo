--stack_templates_generated-8b404049-cca1-4038-97c4-1ba52772a40b_f155d705-13a8-3c46-bc08-3599e17727e2.sql
--{"gen": "erase", "time": 1.8511567115783691, "template": "generated-8b404049-cca1-4038-97c4-1ba52772a40b", "dataset": "stack_templates", "rows": 7913}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2
WHERE (s1.site_name = 'hermeneutics' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id)
