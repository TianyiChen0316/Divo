--stack_templates_q4-075_f8cacb9c-c394-33ee-b959-c199b026fedb.sql
--{"gen": "combine", "time": 0.23153471946716309, "template": "q4-075", "dataset": "stack_templates", "rows": 1}
SELECT count(distinct account.display_name)
FROM account AS account,
answer AS a1,
question AS q1,
site AS s1,
so_user AS u1,
tag AS t1,
tag_question AS tq1,
account AS acc,
badge AS b,
site AS s
WHERE (s1.site_name = 'drupal' AND t1.name = 'cuda' AND b.name IN ('Autobiographer', 'Editor', 'Informed', 'Scholar', 'Student') AND s.site_name IN ('academia', 'graphicdesign', 'scifi', 'softwareengineering', 'webapps') AND a1.owner_user_id = u1.id AND a1.question_id = q1.id AND a1.site_id = q1.site_id AND a1.site_id = u1.site_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND t1.site_id = s1.site_id AND tq1.question_id = q1.id AND tq1.site_id = s1.site_id AND tq1.tag_id = t1.id AND acc.id = u1.account_id AND b.user_id = u1.id AND s.site_id = a1.site_id AND s.site_id = b.site_id AND s.site_id = q1.site_id AND s.site_id = t1.site_id AND s.site_id = tq1.site_id AND s.site_id = u1.site_id AND account.id = acc.id AND b.user_id = a1.owner_user_id AND t1.site_id = u1.site_id AND t1.site_id = q1.site_id AND t1.site_id = a1.site_id AND t1.site_id = b.site_id AND t1.site_id = tq1.site_id AND s.site_id = s1.site_id AND u1.site_id = q1.site_id AND u1.site_id = s1.site_id AND u1.site_id = b.site_id AND u1.site_id = tq1.site_id AND q1.site_id = b.site_id AND q1.site_id = tq1.site_id AND a1.site_id = s1.site_id AND a1.site_id = b.site_id AND a1.site_id = tq1.site_id AND s1.site_id = b.site_id AND b.site_id = tq1.site_id AND tq1.question_id = a1.question_id AND a1.creation_date >= q1.creation_date + '1 year'::interval)
