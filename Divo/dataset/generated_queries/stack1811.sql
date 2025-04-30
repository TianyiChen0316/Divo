--stack_templates_generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6_fde21d61-a3e1-31c4-8e95-3014415ff57c.sql
--{"gen": "erase", "time": 0.9459929466247559, "template": "generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q1,
site AS s,
tag_question AS tq1
WHERE (s.site_name IN ('askubuntu', 'math') AND q1.favorite_count <= 10 AND q1.favorite_count >= 5 AND s.site_id = q1.site_id AND s.site_id = tq1.site_id AND q1.id = tq1.question_id AND q1.site_id = tq1.site_id)
