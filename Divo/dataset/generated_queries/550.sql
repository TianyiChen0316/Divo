--{"gen": "erase", "time": "/", "template": "5a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM info_type AS it,
movie_companies AS mc,
movie_info AS mi,
title AS t
WHERE (mc.note LIKE '%(worldwide)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id)
