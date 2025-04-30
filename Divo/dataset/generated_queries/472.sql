--{"gen": "combine", "time": "/", "template": "generated-2ba01e74-b41f-44aa-a169-45dce802160b", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
info_type AS it1,
movie_info AS mi,
cast_info AS ci,
name AS n,
person_info AS pi,
aka_title AS at,
company_type AS ct,
movie_companies AS mc
WHERE (it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '9.0' AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND ci.person_id = n.id AND n.id = pi.person_id AND mi.info_type_id = it1.id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.person_id = pi.person_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND ct.id = mc.company_type_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi_idx.movie_id)
