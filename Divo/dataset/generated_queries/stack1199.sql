--stack_templates_generated-39648dcc-7b59-4a3d-9afe-a96c0f276801_aec70208-c804-3a3f-87cc-cdb6c7f4a12b.sql
--{"gen": "erase", "time": 0.3908348083496094, "template": "generated-39648dcc-7b59-4a3d-9afe-a96c0f276801", "dataset": "stack_templates", "rows": 1}
SELECT count(*)
FROM question AS q,
tag AS t,
tag_question AS tq,
badge AS b1,
question AS q1,
so_user AS u1,
tag_question AS tq1,
account AS account,
site AS s1
WHERE (q.score > 6 AND q.score > 5 AND t.name IN ('tables', 'tikz-pgf') AND q1.favorite_count >= 5 AND q1.favorite_count >= 0 AND account.website_url <> '' AND s1.site_name = 'patents' AND tq.question_id = q.id AND tq.tag_id = t.id AND b1.user_id = u1.id AND q1.id = tq1.question_id AND q1.owner_user_id = u1.id AND tq.site_id = u1.site_id AND tq.site_id = b1.site_id AND tq.site_id = q1.site_id AND tq.site_id = t.site_id AND tq.site_id = tq1.site_id AND tq.site_id = q.site_id AND u1.site_id = b1.site_id AND u1.site_id = q1.site_id AND u1.site_id = t.site_id AND u1.site_id = tq1.site_id AND u1.site_id = q.site_id AND b1.site_id = q1.site_id AND b1.site_id = t.site_id AND b1.site_id = tq1.site_id AND b1.site_id = q.site_id AND q1.site_id = t.site_id AND q1.site_id = tq1.site_id AND q1.site_id = q.site_id AND t.site_id = tq1.site_id AND t.site_id = q.site_id AND tq1.site_id = q.site_id AND b1.user_id = q1.owner_user_id AND account.id = u1.account_id AND q1.site_id = s1.site_id AND tq1.site_id = s1.site_id AND u1.site_id = s1.site_id AND tq.site_id = s1.site_id AND b1.site_id = s1.site_id AND t.site_id = s1.site_id AND s1.site_id = q.site_id)
