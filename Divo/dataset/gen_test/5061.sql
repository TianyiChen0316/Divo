--{"gen": "erase", "time": "/", "template": "8d", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt
WHERE (cn.country_code = '[hk]' AND rt.role = 'costume designer' AND n1.id = ci.person_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id)
