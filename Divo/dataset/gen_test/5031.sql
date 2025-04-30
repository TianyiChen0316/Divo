--{"gen": "combine", "time": "/", "template": "generated-2fc3264a-dfc6-4b35-8096-793469e01aa5", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character_name,
min(mi_idx.info) AS rating,
min(t.title) AS complete_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
char_name AS chn,
cast_info AS ci,
info_type AS it2,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
company_name AS cn,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (cct1.kind = 'cast' AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND it2.info = 'rating' AND t.production_year > 2000 AND cn.country_code = '[us]' AND it.info = 'rating' AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND chn.id = ci.person_role_id AND cct1.id = cc.subject_id AND it2.id = mi_idx.info_type_id AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND mi.info_type_id = mi_idx.info_type_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = cc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id)
