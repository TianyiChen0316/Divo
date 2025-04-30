--stack_templates_generated-cf862794-02ba-47c9-82d4-308e5fc60b9a_bd5476f4-3b5f-3802-9585-6efb7ee623cd.sql
--{"gen": "erase", "time": 1.9685118198394775, "template": "generated-cf862794-02ba-47c9-82d4-308e5fc60b9a", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM answer AS a1,
badge AS b,
question AS q1,
so_user AS u1,
tag_question AS tq1,
badge AS b2
WHERE (q1.score >= 10 AND q1.score > 14 AND u1.reputation <= 100000 AND u1.reputation <= 100000 AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND b2.name = 'API Evangelist' AND q1.id = tq1.question_id AND q1.id = a1.question_id AND a1.owner_user_id = u1.id AND b.user_id = u1.id AND b.site_id = u1.site_id AND b.site_id = a1.site_id AND b.site_id = q1.site_id AND b.site_id = tq1.site_id AND u1.site_id = a1.site_id AND u1.site_id = q1.site_id AND u1.site_id = tq1.site_id AND a1.site_id = q1.site_id AND a1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.question_id = tq1.question_id AND a1.owner_user_id = b.user_id AND u1.site_id = b2.site_id AND q1.site_id = b2.site_id AND b2.site_id = tq1.site_id AND q1.owner_user_id = b2.user_id AND b2.user_id = u1.id AND a1.site_id = b2.site_id AND b2.site_id = b.site_id AND q1.owner_user_id = b.user_id AND q1.owner_user_id = u1.id AND q1.owner_user_id = a1.owner_user_id AND b2.user_id = b.user_id AND b2.user_id = a1.owner_user_id)
 order by count(*) desc LIMIT 100