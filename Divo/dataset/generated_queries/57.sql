--{"gen": "combine", "time": "/", "template": "8c", "dataset": "full_job", "rows": null}
SELECT min(a1.name) AS writer_pseudo_name,
min(t.title) AS movie_title
FROM aka_name AS a1,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt,
title AS t,
company_type AS ct,
keyword AS k,
movie_keyword AS mk,
movie_link AS ml
WHERE (cn.country_code = '[us]' AND rt.role = 'writer' AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND k.keyword IN ('sequel', 'revenge', 'based-on-novel') AND a1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND a1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id)
