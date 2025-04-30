--{"gen": "erase", "time": "/", "template": "generated-0022ef18-4f94-4049-8d95-76459443b0e2", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date
FROM aka_title AS at,
movie_companies AS mc,
movie_info AS mi,
name AS n,
cast_info AS ci,
person_info AS pi,
aka_name AS an1,
company_name AS cn,
name AS n1,
role_type AS rt
WHERE (mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND lower(pi.info) LIKE '%japan%' AND cn.country_code = '[jp]' AND n1.name LIKE '%Yo%' AND n1.name LIKE 'B%' AND rt.role = 'actress' AND ci.person_id = n.id AND pi.person_id = n.id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND an1.person_id = n.id AND an1.person_id = pi.person_id AND n.id = n1.id AND n1.id = pi.person_id)
