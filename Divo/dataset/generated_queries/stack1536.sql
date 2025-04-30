--stack_templates_generated-9139b404-9157-4cdb-ac4a-85b5018acca1_26498917-352c-3f72-8b9b-138d038a8a8e.sql
--{"gen": "erase", "time": 1.2648558616638184, "template": "generated-9139b404-9157-4cdb-ac4a-85b5018acca1", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
tag_question AS tq1,
tag_question AS tq2,
tag_question AS tag_question,
site AS s,
so_user AS u1
WHERE (s.site_name IN ('askubuntu', 'math') AND u1.downvotes >= 10 AND u1.downvotes <= 1 AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND q1.owner_user_id = u1.id AND s.site_id = q1.site_id AND s.site_id = u1.site_id AND s.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND tq2.site_id = s.site_id AND tq2.site_id = u1.site_id AND c2.site_id = s.site_id AND c2.site_id = u1.site_id AND s.site_id = tag_question.site_id AND s.site_id = pl.site_id AND s.site_id = c1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = pl.site_id AND u1.site_id = c1.site_id AND c1.date < c2.date)
