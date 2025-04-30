--{"gen": "erase", "time": "/", "template": "generated-f2e939ba-ea28-4c35-b2b3-6f26a44929f2", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
link_type AS lt,
movie_link AS ml,
title AS t1,
cast_info AS ci,
role_type AS rt
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND rt.role = 'actor' AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND ml.movie_id = mk.movie_id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.movie_id = mk.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id)
