--stack_templates_generated-285e9c3e-5768-4402-9387-78c261e72a4a_dfc39876-6261-33d0-9380-938dd25f34f4.sql
--{"gen": "erase", "time": 1.9510219097137451, "template": "generated-285e9c3e-5768-4402-9387-78c261e72a4a", "dataset": "stack_templates", "rows": 20}
SELECT *
FROM comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag_question AS tq1,
answer AS a1,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'softwareengineering' AND t2.name = 'web-applications' AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND t2.site_id = u2.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND q1.owner_user_id = a1.owner_user_id AND tq1.question_id = c1.post_id AND c1.post_id = a1.question_id AND c1.score > q1.score AND a1.creation_date >= q1.creation_date + '1 year'::interval)
