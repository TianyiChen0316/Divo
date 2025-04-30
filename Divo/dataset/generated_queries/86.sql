--{"gen": "combine", "time": "/", "template": "generated-7e2feb2a-7f03-44c8-9bbc-89cd733ae446", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_with_american_producer
FROM cast_info AS ci,
movie_companies AS mc,
title AS t,
movie_info_idx AS mi_idx,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
link_type AS lt,
title AS t1,
aka_title AS at,
company_name AS cn,
company_type AS ct,
info_type AS it,
kind_type AS kt,
movie_info_idx AS miidx
WHERE (ci.note LIKE '%(producer)%' AND t.production_year > 1990 AND mi.info IN ('Sweden', 'Germany', 'Swedish', 'German') AND cn.country_code = '[hk]' AND ct.kind = 'production companies' AND it.info = 'rating' AND kt.kind = 'movie' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND ml.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t1.id = mi.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND ml.movie_id = at.movie_id AND mc.movie_id = t1.id AND t1.id = at.movie_id AND ci.movie_id = mk.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND t1.id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND t.id = at.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND kt.id = t.kind_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = t1.id AND miidx.movie_id = at.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = mi_idx.movie_id)
