--{"gen": "erase", "time": "/", "template": "generated-25af8105-a543-4371-99ce-eab0bc44f8b2", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
aka_name AS an,
movie_companies AS mc,
info_type AS it,
movie_link AS ml,
person_info AS pi,
complete_cast AS cc,
comp_cast_type AS cct1,
keyword AS k,
movie_keyword AS mk,
title AS t
WHERE (ci.role_id = 1 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND it.info = 'countries' AND pi.note IS NOT NULL AND cct1.kind = 'cast' AND k.keyword IN ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND t.production_year > 2005 AND ci.movie_id = mc.movie_id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND it.id = pi.info_type_id AND pi.person_id = an.person_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND k.id = mk.keyword_id AND cct1.id = cc.subject_id AND t.id = mc.movie_id AND t.id = ml.linked_movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mk.movie_id AND cc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id)
