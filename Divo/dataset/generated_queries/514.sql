--{"gen": "combine", "time": "/", "template": "generated-7fae498a-77f8-4859-82cb-529c835f40f4", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n,
movie_info AS mi,
movie_info_idx AS mi_idx,
person_info AS pi,
aka_name AS a1,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt,
title AS t
WHERE (mi.info = 'Horror' AND lower(pi.info) LIKE '%japan%' AND cn.country_code = '[us]' AND rt.role = 'writer' AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND pi.person_id = n.id AND ci.person_id = pi.person_id AND a1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND a1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND n.id = n1.id AND n.id = a1.person_id AND n1.id = pi.person_id AND a1.person_id = pi.person_id)
