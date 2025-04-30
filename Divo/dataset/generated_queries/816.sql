--{"gen": "erase", "time": "/", "template": "generated-6df59644-8cfa-4fa6-8460-914e4a3616f1", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t
WHERE (mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 1990 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id)
