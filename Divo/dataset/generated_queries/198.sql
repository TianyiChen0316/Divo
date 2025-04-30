--{"gen": "erase", "time": "/", "template": "generated-a78b41ea-07dd-4adb-bdc1-a8abf59a9cd8", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
movie_info_idx AS mi_idx,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
link_type AS lt,
title AS t1,
aka_title AS at,
keyword AS k
WHERE (ci.note LIKE '%(producer)%' AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German') AND k.keyword = 'character-name-in-title' AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND mc.movie_id = mi_idx.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND ml.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t1.id = mi.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND ml.movie_id = at.movie_id AND mc.movie_id = t1.id AND t1.id = at.movie_id AND ci.movie_id = mk.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND t1.id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.keyword_id = k.id)
