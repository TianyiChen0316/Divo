--{"gen": "combine", "time": "/", "template": "10b", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS russian_mov_with_actor_producer
FROM char_name AS chn,
cast_info AS ci,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
title AS t,
info_type AS it,
movie_link AS ml,
person_info AS pi,
keyword AS k,
movie_keyword AS mk
WHERE (ci.note LIKE '%(producer)%' AND rt.role = 'actor' AND t.production_year > 2010 AND it.info = 'mini biography' AND pi.note IS NOT NULL AND k.keyword IN ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND ct.id = mc.company_type_id AND it.id = pi.info_type_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ci.movie_id AND k.id = mk.keyword_id AND mc.movie_id = mk.movie_id AND mk.movie_id = ml.linked_movie_id AND t.id = mk.movie_id AND t.id = ml.linked_movie_id)
