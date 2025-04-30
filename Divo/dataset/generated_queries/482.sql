--{"gen": "erase", "time": "/", "template": "5b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_vhs_movie
FROM info_type AS it,
movie_companies AS mc,
movie_info AS mi,
title AS t
WHERE (mc.note LIKE '%(VHS)%' AND mc.note LIKE '%(USA)%' AND mc.note LIKE '%(worldwide)%' AND mi.info IN ('USA', 'America') AND t.production_year > 2010 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id)
