--{"gen": "combine", "time": "/", "template": "21b", "dataset": "full_job", "rows": null}
SELECT min(lt.link) AS link_type,
min(t.title) AS german_follow_up
FROM keyword AS k,
link_type AS lt,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS mi_idx,
cast_info AS ci,
role_type AS rt
WHERE (k.keyword = 'sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND mi.info IN ('Germany', 'German') AND t.production_year BETWEEN 2000 AND 2010 AND it1.info = 'countries' AND it2.info = 'height' AND kt.kind IN ('movie', 'episode') AND mi_idx.info < '8.5' AND ci.note LIKE '%(uncredited)%' AND rt.role = 'actor' AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mi.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND rt.id = ci.role_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id)
