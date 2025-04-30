--{"gen": "combine", "time": "/", "template": "generated-1503deff-3960-4ed2-9732-1a518ad7b929", "dataset": "full_job", "rows": null}
SELECT min(cn1.name) AS first_company,
min(cn2.name) AS second_company,
min(mi_idx1.info) AS first_rating,
min(t2.title) AS second_movie
FROM company_name AS cn1,
company_name AS cn2,
info_type AS it1,
kind_type AS kt2,
movie_companies AS mc1,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_link AS ml,
title AS t2,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
cast_info AS ci
WHERE (cn1.country_code = '[nl]' AND it1.info = 'rating' AND kt2.kind IN ('tv series') AND t2.production_year = 2007 AND cn.country_code <> '[us]' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND t2.id = ml.linked_movie_id AND it1.id = mi_idx1.info_type_id AND cn1.id = mc1.company_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND kt2.id = t2.kind_id AND cn2.id = mc2.company_id AND t2.id = mc2.movie_id AND ml.linked_movie_id = mc2.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.info_type_id = mi_idx1.info_type_id)
