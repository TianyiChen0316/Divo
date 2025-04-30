--{"gen": "erase", "time": "/", "template": "generated-88fcfc8e-7f3c-4aa4-8f17-d7fcad993fdd", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(n.name) AS playing_actor,
min(t.title) AS complete_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
cast_info AS ci,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
title AS t,
info_type AS it,
movie_info AS mi,
company_name AS cn,
info_type AS it1,
movie_companies AS mc
WHERE (cct1.kind = 'cast' AND k.keyword IN ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND mi_idx.info > '6.5' AND t.production_year > 2000 AND it.id = 3 AND lower(mi.info) LIKE '%action%' AND cn.country_code <> '[pl]' AND it1.info = 'countries' AND mc.note LIKE '%(USA)%' AND mc.note LIKE '%(1994)%' AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND mc.movie_id = ci.movie_id AND it1.id = it.id)
