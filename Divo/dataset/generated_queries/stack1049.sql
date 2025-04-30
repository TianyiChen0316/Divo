--stack_templates_generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af_29be3a18-a594-309f-953c-b8610eecf2fb.sql
--{"gen": "combine", "time": 1.5714588165283203, "template": "generated-c0f4d5a0-67b7-4c5f-9e6b-e50497a201af", "dataset": "stack_templates", "rows": 1085}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Famous Question' AND b2.name = 'Documentation Pioneer' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
