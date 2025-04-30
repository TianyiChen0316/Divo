--{"gen": "combine", "time": "/", "template": "generated-c25ed4ee-2807-455a-b35f-1a29ee72960d", "dataset": "full_job", "rows": null}
SELECT min(t.title)
FROM movie_info_idx AS mi_idx,
title AS t,
cast_info AS ci,
person_info AS pi,
movie_companies AS mc,
movie_keyword AS mk,
complete_cast AS cc,
link_type AS lt,
movie_info AS mi,
movie_link AS ml
WHERE (lower(pi.info) LIKE '%usa%' AND (lower(mi_idx.info) LIKE '0%' OR lower(mi_idx.info) LIKE '1%' OR lower(mi_idx.info) LIKE '2%') AND lt.link LIKE '%follow%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'English') AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi_idx.movie_id AND pi.person_id = ci.person_id AND mc.movie_id = mk.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mi.movie_id = t.id AND t.id = cc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND ml.movie_id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ml.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.info_type_id = pi.info_type_id)
