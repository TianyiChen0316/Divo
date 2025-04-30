--{"gen": "erase", "time": "/", "template": "e2a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS russian_movie
FROM cast_info AS ci,
movie_companies AS mc,
title AS t
WHERE (ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND t.production_year > 2003 AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id)
