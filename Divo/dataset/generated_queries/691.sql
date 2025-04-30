--{"gen": "combine", "time": "/", "template": "generated-6785ce76-313c-4b52-be4b-9c32eec4eae5", "dataset": "full_job", "rows": null}
SELECT min(n.name),
min(t.title)
FROM info_type AS it1,
movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
name AS n,
person_info AS pi,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (lower(it1.info) LIKE 'rating' AND lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND k.keyword = 'character-name-in-title' AND it1.id = mi_idx.info_type_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.movie_id = mi_idx.movie_id AND pi.person_id = ci.person_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)
