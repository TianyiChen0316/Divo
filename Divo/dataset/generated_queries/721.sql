--{"gen": "combine", "time": "/", "template": "generated-10ecab02-f17c-4d0c-8f92-6b8cd266b844", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes,
min(n.name) AS male_writer
FROM cast_info AS ci,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
name AS n,
company_type AS ct,
link_type AS lt,
movie_companies AS mc,
movie_link AS ml,
title AS t
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n.gender = 'm' AND ct.kind = 'production companies' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND t.production_year > 2000 AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND n.id = ci.person_id AND k.id = mk.keyword_id AND lt.id = ml.link_type_id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = ml.movie_id AND t.id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id)
