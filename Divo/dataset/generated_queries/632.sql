--{"gen": "erase", "time": "/", "template": "generated-8ece7faa-366b-43eb-a147-6fcdf16de349", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
info_type AS it2,
movie_info_idx AS mi_idx,
name AS n,
person_info AS pi
WHERE (ci.note LIKE '%(producer)%' AND rt.role = 'actor' AND k.keyword LIKE '%sequel%' AND mi.info ILIKE '%france%' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND ct.id = mc.company_type_id AND mk.keyword_id = k.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND ci.movie_id = mi_idx.movie_id AND pi.person_id = ci.person_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
