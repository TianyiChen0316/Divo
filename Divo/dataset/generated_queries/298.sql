--{"gen": "erase", "time": "/", "template": "generated-36a72c0a-9027-4617-90b8-cdfef7cbef5f", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_companies AS mc,
movie_keyword AS mk,
title AS t
WHERE (mc.movie_id = t.id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id)
