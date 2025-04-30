--{"gen": "erase", "time": "/", "template": "generated-d1d25e04-1bad-4c30-87b6-cd47e1ad7ffc", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
movie_keyword AS mk
WHERE (ci.note LIKE '%(voice)%' AND cn.country_code = '[us]' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id)
