--{"gen": "combine", "time": "/", "template": "generated-5948fb59-28b5-479f-8c3e-e81e6d5df702", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
name AS n,
movie_info AS mi,
info_type AS it1,
person_info AS pi
WHERE (cn.country_code = '[de]' AND k.keyword = 'character-name-in-title' AND it1.id = 3 AND lower(mi.info) LIKE '%adult%' AND lower(pi.info) LIKE '%japan%' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi.movie_id AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id)
