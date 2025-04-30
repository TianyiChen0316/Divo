--stack_templates_q6-072_9d1056b3-4f5a-351c-8445-11ee2a4e10ba.sql
--{"gen": "combine", "time": 1.6521036624908447, "template": "q6-072", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
comment AS c1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
post_link AS pl,
question AS q2,
tag AS tag,
tag_question AS tq2
WHERE (s1.site_name = 'emacs' AND t1.name IN ('copyright', 'sunyata') AND tag.name IN ('wpf', '.net', 'json') AND account.id = u1.account_id AND c1.post_id = q1.id AND c1.site_id = q1.site_id AND q1.owner_user_id = u1.id AND q1.site_id = s1.site_id AND q1.site_id = u1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND pl.site_id = q1.site_id AND pl.post_id_from = q1.id AND pl.site_id = q2.site_id AND pl.post_id_to = q2.id AND tag.id = tq1.tag_id AND tag.site_id = tq1.site_id AND tag.id = tq2.tag_id AND tag.site_id = tq1.site_id AND tag.site_id = pl.site_id AND tq2.site_id = q2.site_id AND tq2.question_id = q2.id AND tq2.tag_id = tq1.tag_id AND pl.site_id = tq2.site_id AND pl.site_id = tq1.site_id AND tq2.site_id = tag.site_id AND tq2.site_id = q1.site_id AND tq2.site_id = tq1.site_id AND tag.site_id = q2.site_id AND tag.site_id = q1.site_id AND q2.site_id = q1.site_id AND q2.site_id = tq1.site_id AND tq1.question_id = pl.post_id_from AND pl.post_id_to = tq2.question_id AND tq2.tag_id = t1.id AND tag.id = t1.id AND tq2.site_id = t1.site_id AND tq2.site_id = u1.site_id AND tq2.site_id = s1.site_id AND tq2.site_id = c1.site_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = tag.site_id AND t1.site_id = pl.site_id AND t1.site_id = q2.site_id AND t1.site_id = tq1.site_id AND t1.site_id = c1.site_id AND u1.site_id = tag.site_id AND u1.site_id = pl.site_id AND u1.site_id = s1.site_id AND u1.site_id = q2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = c1.site_id AND q1.site_id = tq1.site_id AND tag.site_id = s1.site_id AND tag.site_id = c1.site_id AND pl.site_id = s1.site_id AND pl.site_id = c1.site_id AND s1.site_id = q2.site_id AND s1.site_id = c1.site_id AND q2.site_id = c1.site_id AND tq1.site_id = c1.site_id AND tq1.question_id = c1.post_id AND c1.post_id = pl.post_id_from AND c1.score > q1.score)
