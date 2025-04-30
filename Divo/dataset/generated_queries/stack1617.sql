--stack_templates_generated-cc099e32-8cca-4d7f-aa05-69363af11445_6cfb4dfe-03e9-3c16-a5c6-86089c70d0d2.sql
--{"gen": "erase", "time": 2.475649833679199, "template": "generated-cc099e32-8cca-4d7f-aa05-69363af11445", "dataset": "stack_templates", "rows": 703}
SELECT *
FROM question AS q1,
site AS s1,
so_user AS u1,
answer AS a1,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'hermeneutics' AND t2.name = 'audio' AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND a1.site_id = s1.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND u1.site_id = s1.site_id AND q1.owner_user_id = a1.owner_user_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
