--stack_templates_generated-5f1f578f-cde4-4fd9-a8c4-04b5b77941c0_0ab04781-0dcd-3229-9112-61eb525de76a.sql
--{"gen": "combine", "time": 1.0498249530792236, "template": "generated-5f1f578f-cde4-4fd9-a8c4-04b5b77941c0", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct q1.id)
FROM comment AS c2,
post_link AS pl,
question AS q1,
question AS q2,
tag AS tag,
tag_question AS tq1,
tag_question AS tq2,
question AS question,
tag_question AS tag_question,
site AS s1,
so_user AS u1,
account AS account,
so_user AS so_user,
answer AS a1,
so_user AS u2
WHERE (tag.name IN ('wpf', '.net', 'json') AND s1.site_name = 'esperanto' AND account.website_url <> '' AND c2.post_id = q2.id AND c2.site_id = q2.site_id AND pl.post_id_from = q1.id AND pl.post_id_to = q2.id AND pl.site_id = q1.site_id AND pl.site_id = q2.site_id AND tag.id = tq1.tag_id AND tag.id = tq2.tag_id AND tag.site_id = pl.site_id AND tag.site_id = tq1.site_id AND tag.site_id = tq1.site_id AND tq1.question_id = q1.id AND tq1.site_id = q1.site_id AND tq2.question_id = q2.id AND tq2.site_id = q2.site_id AND tag_question.question_id = question.id AND tag_question.tag_id = tag.id AND tq1.tag_id = tq2.tag_id AND tq1.tag_id = tag_question.tag_id AND tq2.tag_id = tag_question.tag_id AND tq1.question_id = pl.post_id_from AND tq2.site_id = c2.site_id AND tq2.site_id = question.site_id AND tq2.site_id = tag_question.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = pl.site_id AND tq2.site_id = tq1.site_id AND c2.site_id = question.site_id AND c2.site_id = tag_question.site_id AND c2.site_id = q1.site_id AND c2.site_id = tag.site_id AND c2.site_id = pl.site_id AND c2.site_id = tq1.site_id AND question.site_id = tag_question.site_id AND question.site_id = q1.site_id AND question.site_id = tag.site_id AND question.site_id = pl.site_id AND question.site_id = q2.site_id AND question.site_id = tq1.site_id AND tag_question.site_id = q1.site_id AND tag_question.site_id = tag.site_id AND tag_question.site_id = pl.site_id AND tag_question.site_id = q2.site_id AND tag_question.site_id = tq1.site_id AND q1.site_id = tag.site_id AND q1.site_id = q2.site_id AND tag.site_id = q2.site_id AND pl.site_id = tq1.site_id AND q2.site_id = tq1.site_id AND c2.post_id = pl.post_id_to AND c2.post_id = tq2.question_id AND pl.post_id_to = tq2.question_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = u1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND account.id = so_user.account_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND so_user.account_id = u1.account_id AND so_user.account_id = u2.account_id AND q1.site_id = a1.site_id AND a1.question_id = q1.id AND q1.owner_user_id = a1.owner_user_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = a1.site_id AND c2.site_id = u1.site_id AND c2.site_id = s1.site_id AND c2.site_id = a1.site_id AND question.site_id = u1.site_id AND question.site_id = s1.site_id AND question.site_id = a1.site_id AND u1.site_id = tag_question.site_id AND u1.site_id = tag.site_id AND u1.site_id = pl.site_id AND u1.site_id = q2.site_id AND tag_question.site_id = s1.site_id AND tag_question.site_id = a1.site_id AND tag.site_id = s1.site_id AND tag.site_id = a1.site_id AND pl.site_id = s1.site_id AND pl.site_id = a1.site_id AND q2.site_id = s1.site_id AND q2.site_id = a1.site_id AND a1.question_id = pl.post_id_from)
