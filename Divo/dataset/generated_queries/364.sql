--{"gen": "erase", "time": "/", "template": "8d", "dataset": "full_job", "rows": null}
SELECT min(an1.name) AS costume_designer_pseudo
FROM aka_name AS an1,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt
WHERE (cn.country_code = '[us]' AND rt.role = 'costume designer' AND an1.person_id = n1.id AND n1.id = ci.person_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id)
