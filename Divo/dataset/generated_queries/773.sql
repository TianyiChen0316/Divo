--{"gen": "combine", "time": "/", "template": "generated-9a250ad4-b1d7-4a16-8b3e-365ef0a0ed7c", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(n.name) AS writer
FROM cast_info AS ci,
info_type AS it1,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
movie_companies AS mc,
movie_info_idx AS miidx,
kind_type AS kt2,
movie_companies AS mc1,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_info_idx AS mi_idx2,
movie_link AS ml,
title AS t1,
title AS t2
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND mi.info IN ('Horror', 'Thriller') AND n.gender = 'm' AND kt2.kind IN ('tv series', 'episode') AND mi_idx2.info < '3.5' AND t2.production_year BETWEEN 2000 AND 2010 AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND t1.id = ml.movie_id AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND t1.id = mi_idx1.movie_id AND t1.id = mc1.movie_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND t2.id = mi_idx2.movie_id AND kt2.id = t2.kind_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mi_idx2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mi_idx2.movie_id = mc2.movie_id AND mi.info_type_id = mi_idx1.info_type_id)
