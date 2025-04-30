--{"gen": "combine", "time": "/", "template": "generated-4e2ff335-6752-45fa-a6df-9a856bf7fa17", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
info_type AS it1,
info_type AS it2,
name AS n,
person_info AS pi,
info_type AS it,
keyword AS k,
movie_info AS mi
WHERE (ci.note LIKE '%(uncredited)%' AND mi_idx.info < '7.0' AND lower(it1.info) LIKE 'rating' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%usa%' AND it.info = 'mini biography' AND k.keyword ILIKE '%love%' AND lower(mi.info) LIKE '%usa%' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND it1.id = mi_idx.info_type_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND mi.info_type_id = it1.id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi.movie_id AND mi.info_type_id = mi_idx.info_type_id AND mi.info_type_id = it.id AND it1.id = it.id AND ci.person_id = pi.person_id)
