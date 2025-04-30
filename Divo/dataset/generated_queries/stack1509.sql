--stack_templates_q7-043_77b026ba-36cb-3798-bdaf-43da85e75286.sql
--{"gen": "erase", "time": 1.6481938362121582, "template": "q7-043", "dataset": "stack_templates", "rows": 10}
SELECT *
FROM badge AS b1,
badge AS b2,
so_user AS so_user
WHERE (b1.name = 'Sheriff' AND b2.name = 'Reversal' AND b1.site_id = so_user.site_id AND b1.user_id = so_user.id AND b2.site_id = so_user.site_id AND b2.user_id = so_user.id AND b2.site_id = b1.site_id AND b2.user_id = b1.user_id AND b2.date > b1.date + '11 months'::interval)
