--stack_templates_generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6_e3285f1c-12c2-3ce9-b680-ba3e42a55c31.sql
--{"gen": "erase", "time": 0.24381327629089355, "template": "generated-2d13926b-edd2-42ef-aad8-47c9b8b1c1e6", "dataset": "stack_templates", "rows": 4}
SELECT count(*),
t1.name
FROM question AS q1,
tag AS t1,
tag_question AS tq1
WHERE (t1.name IN ('analysis', 'combinatorics', 'group-theory', 'inequality') AND q1.favorite_count <= 1 AND q1.favorite_count >= 0 AND q1.id = tq1.question_id AND t1.id = tq1.tag_id AND t1.site_id = q1.site_id AND t1.site_id = tq1.site_id AND q1.site_id = tq1.site_id)
 group by t1.name