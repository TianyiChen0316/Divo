--stack_templates_generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6_425bdbd0-98c1-3a84-9600-33c36f1a1430.sql
--{"gen": "erase", "time": 1.2703747749328613, "template": "generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
site AS s,
tag_question AS tq1
WHERE (s.site_name IN ('askubuntu', 'math') AND q1.favorite_count <= 1 AND q1.favorite_count <= 10 AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND q1.id = tq1.question_id AND q1.site_id = tq1.site_id)
