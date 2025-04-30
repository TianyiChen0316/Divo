--{"gen": "combine", "time": "/", "template": "generated-518aca4b-60f0-45d9-ac17-fc0f6fb11414", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title) AS russian_movie
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
title AS t,
company_name AS cn,
keyword AS k,
movie_keyword AS mk,
info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND t.production_year > 2003 AND cn.country_code = '[jp]' AND k.keyword = 'character-name-in-title' AND it1.info = 'countries' AND it2.info = 'rating' AND kt.kind = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info > '3.0' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
