--{"gen": "erase", "time": "/", "template": "generated-837f012d-def7-48fe-af5b-eecfff72ba97", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM info_type AS it,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
info_type AS it1,
movie_info AS mi,
cast_info AS ci,
person_info AS pi,
movie_companies AS mc,
title AS t
WHERE (it.info = 'rating' AND mi_idx.info > '9.0' AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(co-production)%' OR mc.note LIKE '%(presents)%') AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mi.info_type_id = it1.id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.person_id = pi.person_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id)
