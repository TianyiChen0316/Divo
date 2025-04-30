--{"gen": "combine", "time": "/", "template": "generated-af5c124a-b915-483e-b011-41e10d12165c", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character_name,
min(mi_idx.info) AS rating,
min(t.title) AS complete_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
char_name AS chn,
cast_info AS ci,
info_type AS it2,
keyword AS k,
kind_type AS kt,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi
WHERE (cct1.kind = 'cast' AND cct2.kind LIKE '%complete%' AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND it2.info = 'rating' AND k.keyword IN ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND kt.kind = 'movie' AND t.production_year BETWEEN 1980 AND 1995 AND ct.kind = 'production companies' AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id AND it2.id = mi_idx.info_type_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id)
