--{"gen": "erase", "time": "/", "template": "8b", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS acress_pseudonym
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n,
role_type AS rt
WHERE (ci.note = '(voice)' AND cn.country_code = '[jp]' AND mc.note LIKE '%(Japan)%' AND mc.note NOT LIKE '%(USA)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND n.name LIKE '%Yo%' AND n.name LIKE 'Z%' AND rt.role = 'actress' AND an.person_id = n.id AND n.id = ci.person_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id)
