--stack_templates_generated-ce43b83c-1dc2-4db7-8b02-ac38c4c96ccc_f54ce7f0-ea89-313f-9e94-a58b28abc439.sql
--{"gen": "erase", "time": 1.3976783752441406, "template": "generated-ce43b83c-1dc2-4db7-8b02-ac38c4c96ccc", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
so_user AS so_user,
site AS s1
WHERE (q1.score > 7 AND q1.score >= 10 AND u1.reputation <= 100 AND u1.reputation <= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s1.site_name = 'wordpress' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND so_user.account_id = u1.account_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND s1.site_id = b.site_id)
 order by count(*) desc LIMIT 100