--{"gen": "erase", "time": "/", "template": "generated-23d26af8-d935-481a-8272-bcca43fd7af3", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(t.title) AS violent_liongate_movie
FROM cast_info AS ci,
company_name AS cn,
info_type AS it1,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
kind_type AS kt,
company_type AS ct
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.name LIKE 'Lionsgate%' AND it1.info = 'genres' AND it2.info = 'release dates' AND mc.note LIKE '%(Blu-ray)%' AND mi.info IN ('Horror', 'Thriller') AND t.production_year BETWEEN 2005 AND 2008 AND (t.title LIKE '%Freddy%' OR t.title LIKE '%Jason%' OR t.title LIKE 'Saw%') AND kt.kind IN ('movie', 'episode') AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND cn.id = mc.company_id AND kt.id = t.kind_id AND ct.id = mc.company_type_id)
