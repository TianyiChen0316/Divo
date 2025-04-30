--{"gen": "erase", "time": "/", "template": "generated-5ecd6de1-cd35-4768-8f0d-4d7b7dd03bbd", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_about_winning
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
cast_info AS ci
WHERE (t.title <> '' AND (t.title LIKE '%Champion%' OR t.title LIKE '%Loser%') AND ci.note = '(voice)' AND mi.movie_id = t.id AND mc.movie_id = t.id AND mi.movie_id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id)
