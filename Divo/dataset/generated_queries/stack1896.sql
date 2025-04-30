--stack_templates_q1-097_0fbd40c9-e6df-3d2a-bb55-7bfc8f81b42c.sql
--{"gen": "combine", "time": 4.369490146636963, "template": "q1-097", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS question,
tag_question AS tag_question,
tag_question AS tq1,
tag_question AS tq2,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'softwareengineering' AND t2.name = 'python-descriptors' AND tag_question.question_id = question.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = tq1.site_id AND tag_question.site_id = tq1.site_id AND tq1.site_id = s1.site_id AND tq2.tag_id = t2.id AND u1.account_id = u2.account_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = t2.site_id AND tq2.site_id = u2.site_id AND t2.site_id = u2.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND t2.site_id = u1.site_id AND t2.site_id = tag_question.site_id AND t2.site_id = s1.site_id AND t2.site_id = tq1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = u2.site_id AND tag_question.site_id = u2.site_id AND tag_question.site_id = s1.site_id AND u2.site_id = s1.site_id AND u2.site_id = tq1.site_id AND tag_question.tag_id = t2.id AND t2.id = tq1.tag_id AND tq2.site_id = question.site_id AND question.site_id = t2.site_id AND question.site_id = u1.site_id AND question.site_id = tag_question.site_id AND question.site_id = u2.site_id AND question.site_id = s1.site_id AND question.site_id = tq1.site_id)
