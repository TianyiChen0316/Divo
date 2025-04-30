--{"gen": "combine", "time": "/", "template": "generated-9745a091-b979-4cbe-9a30-8a05c8b2d56f", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS from_company,
min(lt.link) AS movie_link_type,
min(t.title) AS non_polish_sequel_movie
FROM company_name AS cn,
company_type AS ct,
keyword AS k,
link_type AS lt,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
movie_info AS mi,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS mi_idx
WHERE (cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind = 'production companies' AND k.keyword = 'sequel' AND lt.link LIKE '%follow%' AND mc.note IS NULL AND t.production_year BETWEEN 1950 AND 2000 AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND it1.info = 'countries' AND it2.info = 'rating' AND kt.kind IN ('movie', 'episode') AND mi_idx.info < '8.5' AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND t.id = ci.movie_id AND t.id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND ml.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id)
