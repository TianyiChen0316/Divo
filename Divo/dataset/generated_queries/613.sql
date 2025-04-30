--{"gen": "erase", "time": "/", "template": "generated-283a2c2f-809b-4d4c-9b58-6e674abb9f7b", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name,
min(t.title) AS marvel_movie
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n,
title AS t,
char_name AS chn,
movie_companies AS mc,
movie_info_idx AS mi_idx
WHERE (n.name LIKE '%Downey%Robert%' AND t.production_year BETWEEN 2007 AND 2010 AND mi_idx.info < '3.5' AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id)
