--stack_templates_generated-b598911c-104c-4b3b-b46a-3d989a19aadb_cdde76de-422a-3fa1-bdf8-605415d4ec25.sql
--{"gen": "erase", "time": 1.8152623176574707, "template": "generated-b598911c-104c-4b3b-b46a-3d989a19aadb", "dataset": "stack_templates", "rows": 49}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user,
question AS q1,
so_user AS u1,
tag_question AS tq1
WHERE (b1.name = 'API Evangelist' AND b2.name = 'Synonymizer' AND q1.favorite_count <= 1 AND q1.favorite_count <= 1 AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = b2.site_id AND u1.site_id = tq1.site_id AND u1.site_id = so_user.site_id AND b1.site_id = q1.site_id AND b1.site_id = b2.site_id AND b1.site_id = tq1.site_id AND q1.site_id = b2.site_id AND q1.site_id = tq1.site_id AND q1.site_id = so_user.site_id AND b2.site_id = tq1.site_id AND tq1.site_id = so_user.site_id AND so_user.id = q1.owner_user_id AND so_user.id = u1.id AND q1.owner_user_id = b2.user_id AND q1.owner_user_id = b1.user_id AND b2.user_id = u1.id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
