--{"gen": "erase", "time": "/", "template": "generated-67f11dc1-e31e-4455-a48b-08f5d6da1960", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS movie_company,
min(mi_idx.info) AS rating,
min(t.title) AS complete_euro_dark_movie
FROM complete_cast AS cc,
comp_cast_type AS cct2,
company_name AS cn,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t
WHERE (cct2.kind = 'complete' AND cn.country_code <> '[us]' AND it1.info = 'countries' AND mc.note LIKE '%(USA)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND t.production_year > 2005 AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = mi_idx.movie_id AND mc.movie_id = cc.movie_id AND mi_idx.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND cct2.id = cc.status_id)
