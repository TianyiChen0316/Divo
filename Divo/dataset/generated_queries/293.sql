--{"gen": "combine", "time": "/", "template": "generated-c5d87266-bae8-4e82-ad74-41b9037c6252", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi,
kind_type AS kt,
movie_info_idx AS miidx,
cast_info AS ci,
movie_link AS ml,
company_name AS cn,
company_type AS ct,
info_type AS it,
info_type AS it2
WHERE (mi_idx.info > '5.0' AND t.production_year > 2005 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND kt.kind = 'movie' AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND cn.country_code = '[us]' AND ct.kind = 'production companies' AND it.info = 'mini biography' AND it2.info = 'release dates' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND ml.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND miidx.movie_id = ml.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id AND it2.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND it.id = miidx.info_type_id)
