--{"gen": "combine", "time": "/", "template": "generated-d98a0b84-28fa-4c56-8d7e-b134cb09a7dc", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
keyword AS k,
info_type AS it,
movie_info AS mi,
movie_companies AS mc,
aka_title AS at,
cast_info AS ci,
movie_info_idx AS mi_idx,
link_type AS lt,
movie_link AS ml
WHERE (it.id = 3 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND lt.link LIKE '%follow%' AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND mc.movie_id = t.id AND mc.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND t.id = at.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mk.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = ml.movie_id AND t.id = ci.movie_id AND t.id = mi_idx.movie_id AND ml.movie_id = at.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = mi_idx.movie_id)
