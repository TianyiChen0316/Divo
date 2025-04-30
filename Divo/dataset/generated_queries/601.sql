--{"gen": "erase", "time": "/", "template": "generated-18b2c517-e341-4881-90f4-257a22824213", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
char_name AS chn
WHERE (k.keyword = 'character-name-in-title' AND ci.role_id = 1 AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND chn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id)
