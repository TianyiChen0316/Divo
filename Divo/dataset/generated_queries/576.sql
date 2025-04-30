--{"gen": "combine", "time": "/", "template": "e11b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM info_type AS it1,
info_type AS it2,
title AS t,
movie_info AS mi,
cast_info AS ci,
name AS n,
person_info AS pi,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND cn.country_code = '[ru]' AND k.keyword = 'character-name-in-title' AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND mi.info_type_id = it1.id AND t.id = mi.movie_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND ci.person_id = pi.person_id)
