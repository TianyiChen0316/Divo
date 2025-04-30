--{"gen": "combine", "time": "/", "template": "16d", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx,
aka_title AS at,
movie_info AS mi,
info_type AS it1,
complete_cast AS cc
WHERE (cn.country_code = '[us]' AND t.episode_nr >= 5 AND t.episode_nr < 100 AND it.info = 'bottom 10 rank' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND it1.info = 'budget' AND ci.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mc.movie_id = at.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mi.info_type_id = it1.id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND t.id = at.movie_id AND at.movie_id = cc.movie_id)
