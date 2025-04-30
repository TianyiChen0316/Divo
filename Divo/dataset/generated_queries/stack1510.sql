--stack_templates_generated-15f27770-6805-4873-90a5-30b02ce66a4c_363e0601-b8fc-3aab-b945-4efd9ef787de.sql
--{"gen": "erase", "time": 2.1822152137756348, "template": "generated-15f27770-6805-4873-90a5-30b02ce66a4c", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'hermeneutics' AND t2.name = 'asp.net-web-api' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND t2.site_id = u2.site_id)
