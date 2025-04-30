--stack_templates_generated-26d46bcb-0ecf-4b22-9835-1125183f816a_561984dd-c001-35ae-bc69-36fe2b9224dc.sql
--{"gen": "erase", "time": 1.7158169746398926, "template": "generated-26d46bcb-0ecf-4b22-9835-1125183f816a", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
question AS q2,
so_user AS u2,
tag AS t2
WHERE (s1.site_name = 'english' AND t2.name = 'sharia' AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND q2.owner_user_id = u2.id AND q2.site_id = u2.site_id AND u1.account_id = u2.account_id AND account.id = u2.account_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND a1.site_id = s1.site_id AND t2.site_id = q2.site_id AND t2.site_id = u2.site_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
