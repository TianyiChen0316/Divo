--stack_templates_generated-5886467c-7558-424e-a40a-591191ffeed5_59d7c116-41df-3f2a-a9db-199fd9b37ea1.sql
--{"gen": "combine", "time": 4.261216163635254, "template": "generated-5886467c-7558-424e-a40a-591191ffeed5", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
question AS q1,
site AS s1,
site AS s2,
so_user AS u1,
so_user AS u2,
tag_question AS tq1,
comment AS c1,
comment AS c2,
post_link AS pl,
tag AS tag,
tag_question AS tq2,
tag_question AS tag_question
WHERE (s1.site_name = 'aviation' AND s2.site_name = 'rpg' AND tag.name IN ('wpf', '.net', 'json') AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND tq1.question_id = q1.id AND u1.account_id = u2.account_id AND account.id = u1.account_id AND u1.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND u2.account_id = account.id AND s2.site_id = u2.site_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND u1.site_id = c1.site_id AND s1.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND pl.post_id_from = q1.id AND pl.site_id = q1.site_id AND tag.id = tq1.tag_id AND tag.id = tq2.tag_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tag.site_id = tq1.site_id AND tag_question.tag_id = tag.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND c1.post_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND tq2.site_id = c1.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = tag.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND c2.site_id = c1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = tag.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = tq1.site_id AND tag_question.site_id = c1.site_id AND q1.site_id = tag.site_id AND tag.site_id = c1.site_id AND pl.site_id = tq1.site_id AND pl.site_id = c1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND c2.site_id = u1.site_id AND c2.site_id = s1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = pl.site_id AND u1.site_id = tag.site_id AND tag_question.site_id = s1.site_id AND pl.site_id = s1.site_id AND s1.site_id = tag.site_id AND c1.score > q1.score AND c1.date < c2.date)
