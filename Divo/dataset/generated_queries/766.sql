--{"gen": "erase", "time": "/", "template": "generated-9b7bd81c-a6e7-4857-b402-d193dbc0e4ab", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM link_type AS lt,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t
WHERE (mc.note IS NOT NULL AND t.production_year BETWEEN 1980 AND 1995 AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id)
