--{"gen": "combine", "time": "/", "template": "10b", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS russian_mov_with_actor_producer
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
title AS t,
info_type AS it1,
movie_info AS mi,
movie_info_idx AS mi_idx,
aka_name AS an1,
name AS n1,
movie_keyword AS mk
WHERE (ci.note LIKE '%(producer)%' AND cn.country_code = '[ru]' AND t.production_year > 2010 AND it1.info = 'genres' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n1.name LIKE '%Yo%' AND n1.name LIKE '%Downey%Robert%' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND cn.id = mc.company_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND an1.person_id = ci.person_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id)
