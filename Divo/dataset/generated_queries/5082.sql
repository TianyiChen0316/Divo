--{"gen": "combine", "time": "/", "template": "5b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_vhs_movie
FROM info_type AS it,
movie_companies AS mc,
movie_info AS mi,
title AS t,
complete_cast AS cc,
company_name AS cn,
movie_link AS ml,
movie_keyword AS mk,
title AS t1
WHERE (mc.note LIKE '%(VHS)%' AND mc.note LIKE '%(USA)%' AND mc.note LIKE '%(1994)%' AND mi.info IN ('USA', 'America') AND t.production_year > 2010 AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id AND ml.movie_id = t.id AND mc.company_id = cn.id AND t.id = cc.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND t.id = t1.id AND t.id = mk.movie_id AND mc.movie_id = t1.id AND mc.movie_id = mk.movie_id AND t1.id = cc.movie_id AND t1.id = mi.movie_id AND cc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id)
