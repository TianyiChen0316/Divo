--stack_templates_q4-075_835074a6-598a-3b57-8c13-ddc743387a5e.sql
--{"gen": "erase", "time": 0.5261940956115723, "template": "q4-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
site AS s1,
so_user AS u1,
tag_question AS tq1
WHERE (s1.site_name = 'rpg' AND tq1.site_id = s1.site_id AND a1.owner_user_id = u1.id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND a1.question_id = tq1.question_id AND u1.site_id = s1.site_id AND u1.site_id = tq1.site_id AND s1.site_id = a1.site_id AND a1.site_id = tq1.site_id)
