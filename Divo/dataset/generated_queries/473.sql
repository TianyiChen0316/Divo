--{"gen": "combine", "time": "/", "template": "11d", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS from_company,
min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM company_name AS cn,
company_type AS ct,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
movie_info AS mi,
info_type AS it,
info_type AS it2,
kind_type AS kt,
movie_info_idx AS miidx
WHERE (cn.country_code <> '[pl]' AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND k.keyword IN ('sequel', 'revenge', 'based-on-novel') AND mc.note IS NOT NULL AND t.production_year > 1950 AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND it.info = 'rating' AND it2.info = 'release dates' AND kt.kind = 'movie' AND ml.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
