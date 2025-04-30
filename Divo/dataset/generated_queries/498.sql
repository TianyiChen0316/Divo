--{"gen": "erase", "time": "/", "template": "generated-25af8105-a543-4371-99ce-eab0bc44f8b2", "dataset": "full_job", "rows": null}
SELECT min(cn.name)
FROM cast_info AS ci,
char_name AS cn,
movie_companies AS mc,
info_type AS it,
movie_link AS ml,
person_info AS pi,
keyword AS k,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t
WHERE (ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND it.info = 'mini biography' AND pi.note IS NOT NULL AND k.keyword IN ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND t.production_year > 2014 AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND mc.company_id = ci.person_role_id AND it.id = pi.info_type_id AND pi.person_id = ci.person_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND t.id = mc.movie_id AND t.id = ml.linked_movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND mk.movie_id = ml.linked_movie_id AND ml.linked_movie_id = mi_idx.movie_id)
