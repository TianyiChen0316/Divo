--stack_templates_q7-043_65172829-fc93-37c1-8d26-4b1bbfc10ba6.sql
--{"gen": "erase", "time": 1.625274419784546, "template": "q7-043", "dataset": "stack_templates", "rows": 494}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Commentator' AND b2.name = 'Sheriff' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
