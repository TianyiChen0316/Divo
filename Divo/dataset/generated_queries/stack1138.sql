--stack_templates_generated-310bcab0-6e74-43f2-9311-8d3259457805_07f8cff2-6a97-3a84-93b6-7e984b760b66.sql
--{"gen": "erase", "time": 0.4738955497741699, "template": "generated-310bcab0-6e74-43f2-9311-8d3259457805", "dataset": "stack_templates", "rows": 306}
SELECT *
FROM comment AS c1,
question AS q1,
site AS s1,
tag_question AS tq1
WHERE (s1.site_name = 'civicrm' AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND c1.site_id = q1.site_id AND c1.post_id = q1.id AND c1.post_id = tq1.question_id AND c1.site_id = s1.site_id AND c1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND c1.score > q1.score)
