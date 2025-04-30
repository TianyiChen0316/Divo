--{"gen": "combine", "time": "/", "template": "generated-8f7dc238-a28e-4f0f-afb5-3c84c9457077", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title)
FROM char_name AS chn,
cast_info AS ci,
role_type AS rt,
movie_companies AS mc,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
keyword AS k,
link_type AS lt,
movie_keyword AS mk,
movie_link AS ml,
title AS t1
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND t.production_year > 2010 AND k.keyword = 'character-name-in-title' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND mc.movie_id = mk.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND t1.id = ci.movie_id AND t1.id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mk.movie_id = mi_idx.movie_id)
