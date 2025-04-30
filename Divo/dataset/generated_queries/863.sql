--{"gen": "erase", "time": "/", "template": "generated-33ceaa99-3e11-42a5-b6fe-cbf989b81073", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(mi_idx.info) AS movie_votes
FROM cast_info AS ci,
movie_info AS mi,
movie_info_idx AS mi_idx,
keyword AS k,
kind_type AS kt,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
company_type AS ct,
movie_link AS ml,
aka_name AS an,
role_type AS rt
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Thriller') AND mi.note IS NULL AND mi_idx.info > '6.0' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind IN ('movie', 'episode') AND mc.note NOT LIKE '%(USA)%' AND mc.note LIKE '%(200%)%' AND t.production_year > 2009 AND ct.kind = 'production companies' AND rt.role = 'writer' AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND an.person_id = ci.person_id AND ci.role_id = rt.id AND ml.movie_id = ci.movie_id AND t.id = ml.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id)
