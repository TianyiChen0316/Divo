--{"gen": "combine", "time": "/", "template": "generated-93d23b23-fd57-4780-ba20-d41e5e4db9a7", "dataset": "full_job", "rows": null}
SELECT min(cn2.name) AS second_company,
min(mi_idx1.info) AS first_rating
FROM company_name AS cn2,
info_type AS it1,
movie_companies AS mc1,
movie_companies AS mc2,
movie_info_idx AS mi_idx1,
movie_link AS ml,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
company_name AS cn,
info_type AS it,
movie_companies AS mc,
movie_info_idx AS miidx
WHERE (it1.info = 'rating' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND t.production_year > 2010 AND cn.country_code = '[us]' AND it.info = 'rating' AND it1.id = mi_idx1.info_type_id AND ml.movie_id = mi_idx1.movie_id AND ml.movie_id = mc1.movie_id AND mi_idx1.movie_id = mc1.movie_id AND cn2.id = mc2.company_id AND ml.linked_movie_id = mc2.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND mc.movie_id = t.id AND cn.id = mc.company_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.info_type_id = mi_idx1.info_type_id)
