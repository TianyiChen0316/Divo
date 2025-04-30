--stack_templates_generated-7bcf888b-5baf-4b1a-ad32-d7f280da3e8e_f1d42328-c590-3aa5-b231-3c73912b130c.sql
--{"gen": "erase", "time": 0.22584104537963867, "template": "generated-7bcf888b-5baf-4b1a-ad32-d7f280da3e8e", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
site AS s1,
answer AS a1
WHERE (q1.score > 13 AND q1.score >= 1 AND u1.reputation >= 0 AND u1.reputation <= 10 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s1.site_name = 'dba' AND q1.id = tq1.question_id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND q1.site_id = s1.site_id AND u1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND q1.id = a1.question_id AND tq1.question_id = a1.question_id AND q1.owner_user_id = a1.owner_user_id AND b.user_id = a1.owner_user_id AND u1.site_id = a1.site_id AND q1.site_id = a1.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND s1.site_id = tq1.site_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = b.user_id)
 order by count(*) desc LIMIT 100