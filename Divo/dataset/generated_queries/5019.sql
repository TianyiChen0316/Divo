--{"gen": "erase", "time": "/", "template": "e3b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND t.production_year BETWEEN 2005 AND 2008 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id)
