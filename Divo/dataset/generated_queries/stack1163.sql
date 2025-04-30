--stack_templates_generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a_09ce0cff-4c11-35b5-852d-bb631dea929f.sql
--{"gen": "erase", "time": 1.3784773349761963, "template": "generated-07b73649-7e4d-4ddd-8c43-f7aa2568af5a", "dataset": "stack_templates", "rows": 7}
SELECT *
FROM answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
question AS q2,
so_user AS u2,
tag_question AS tq2
WHERE (s1.site_name = 'drupal' AND t1.name = 'plugins' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND tq2.question_id = q2.id AND u1.account_id = u2.account_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = tq1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND tq2.site_id = q2.site_id AND tq2.site_id = u2.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
