--{"gen": "erase", "time": "/", "template": "generated-9a250ad4-b1d7-4a16-8b3e-365ef0a0ed7c", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS writer,
min(t.title) AS complete_violent_movie
FROM cast_info AS ci,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
title AS t,
movie_companies AS mc,
movie_info_idx AS miidx
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'bottom 10 rank' AND mi.info IN ('Horror', 'Thriller') AND n.gender = 'm' AND t.production_year BETWEEN 2008 AND 2014 AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND it1.id = mi.info_type_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id)
