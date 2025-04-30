--{"gen": "erase", "time": "/", "template": "generated-b3450133-a428-4148-bfb1-3bf518a652aa", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_vhs_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
complete_cast AS cc,
company_name AS cn,
movie_link AS ml,
title AS t1
WHERE (mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(200%)%' AND mc.note LIKE '%(1994)%' AND mi.info IN ('USA', 'America') AND t.production_year > 2010 AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = t.id AND mc.company_id = cn.id AND t.id = cc.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ml.movie_id = t1.id AND t.id = t1.id AND mc.movie_id = t1.id AND t1.id = cc.movie_id AND t1.id = mi.movie_id)
