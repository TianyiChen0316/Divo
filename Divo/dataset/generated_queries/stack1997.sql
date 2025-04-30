--stack_templates_generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816_9c349182-803a-3afa-9fc8-d76f7c2cfe67.sql
--{"gen": "combine", "time": 0.2856452465057373, "template": "generated-69b4b21b-0e1e-43cf-992a-3c3bf04cb816", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c1,
comment AS c2,
post_link AS pl,
question AS q1,
site AS site,
tag_question AS tq1,
tag_question AS tq2,
tag_question AS tag_question,
site AS s1,
so_user AS u1,
answer AS a1,
so_user AS u2
WHERE (site.site_name = 'health' AND s1.site_name = 'bitcoin' AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND pl.site_id = site.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tag_question.site_id = site.site_id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = c1.post_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = site.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = site.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = site.site_id AND site.site_id = tq1.site_id AND site.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND tq1.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND u1.account_id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND tq2.site_id = u1.site_id AND tq2.site_id = a1.site_id AND tq2.site_id = s1.site_id AND c2.site_id = u1.site_id AND c2.site_id = a1.site_id AND c2.site_id = s1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = site.site_id AND u1.site_id = pl.site_id AND u1.site_id = c1.site_id AND tag_question.site_id = a1.site_id AND tag_question.site_id = s1.site_id AND site.site_id = a1.site_id AND site.site_id = s1.site_id AND a1.site_id = pl.site_id AND a1.site_id = c1.site_id AND pl.site_id = s1.site_id AND s1.site_id = c1.site_id AND a1.question_id = pl.post_id_from AND a1.question_id = c1.post_id AND c1.date < c2.date)
