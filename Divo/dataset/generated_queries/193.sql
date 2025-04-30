--{"gen": "erase", "time": "/", "template": "generated-2e58323a-3b3b-4a71-a41f-4d8d9f38abd3", "dataset": "full_job", "rows": null}
SELECT min(n.name)
FROM movie_info_idx AS mi_idx,
cast_info AS ci,
name AS n,
person_info AS pi,
info_type AS it,
keyword AS k,
movie_keyword AS mk,
movie_info AS mi,
movie_companies AS mc
WHERE (lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND it.info = 'top 250 rank' AND k.keyword LIKE '%sequel%' AND lower(mi.info) LIKE '%usa%' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND (mc.note LIKE '%(co-production)%' OR mc.note LIKE '%(presents)%') AND ci.person_id = n.id AND n.id = pi.person_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.info_type_id = mi_idx.info_type_id AND mi.info_type_id = it.id AND ci.person_id = pi.person_id)
