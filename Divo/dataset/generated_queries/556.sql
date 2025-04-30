--{"gen": "erase", "time": "/", "template": "generated-c6c58363-87f6-4dc6-b3f6-ba1740b8c41f", "dataset": "full_job", "rows": null}
SELECT min(miidx.info) AS rating,
min(t.title) AS movie_about_winning
FROM info_type AS it,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
title AS t,
aka_name AS an,
char_name AS chn,
cast_info AS ci
WHERE (it.info = 'rating' AND it2.info = 'mini biography' AND t.title <> '' AND (t.title LIKE '%Champion%' OR t.title LIKE '%Loser%') AND ci.note = '(voice)' AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND ci.person_id = an.person_id AND chn.id = ci.person_role_id AND miidx.movie_id = ci.movie_id)
