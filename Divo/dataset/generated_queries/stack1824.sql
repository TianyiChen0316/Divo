--stack_templates_generated-30cc227b-fd62-4367-a774-d2876a987fb5_8fd0db30-6d4f-3852-91be-f1b5c4ae17b4.sql
--{"gen": "erase", "time": 0.48987245559692383, "template": "generated-30cc227b-fd62-4367-a774-d2876a987fb5", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
tag_question AS tag_question,
site AS s1,
so_user AS u1,
question AS q2,
tag AS t2
WHERE (s1.site_name = 'hermeneutics' AND t2.name = 'general-relativity' AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND pl.site_id = tq1.site_id AND pl.post_id_to = tq2.question_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq2.question_id = q2.id AND tq2.tag_id = t2.id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = t2.site_id AND tq2.site_id = q2.site_id AND t2.site_id = q2.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND t2.site_id = u1.site_id AND t2.site_id = tag_question.site_id AND t2.site_id = q1.site_id AND t2.site_id = pl.site_id AND t2.site_id = s1.site_id AND t2.site_id = tq1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND tag_question.site_id = s1.site_id AND tag_question.site_id = q2.site_id AND q1.site_id = q2.site_id AND pl.site_id = s1.site_id AND pl.site_id = q2.site_id AND s1.site_id = q2.site_id AND q2.site_id = tq1.site_id AND tag_question.tag_id = t2.id AND t2.id = tq1.tag_id AND pl.post_id_to = q2.id)
