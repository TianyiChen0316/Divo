--{"gen": "combine", "time": "/", "template": "generated-83c9b515-91fd-477e-b0b1-5d7a2d6f79fa", "dataset": "full_job", "rows": null}
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
movie_keyword AS mk,
aka_title AS at,
movie_info AS mi,
aka_name AS an
WHERE (lower(it1.info) LIKE 'rating' AND lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND k.keyword = 'character-name-in-title' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND it1.id = mi_idx.info_type_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.movie_id = mi_idx.movie_id AND pi.person_id = ci.person_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mi.movie_id AND t.id = at.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi_idx.movie_id AND n.id = an.person_id AND pi.person_id = an.person_id)
