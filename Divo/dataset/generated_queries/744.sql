--{"gen": "combine", "time": "/", "template": "generated-c9941e8a-e835-4f65-a65b-0a37a9022882", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_dynamic_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
cast_info AS ci,
movie_keyword AS mk,
title AS t,
char_name AS cn,
aka_name AS an,
movie_companies AS mc,
movie_link AS ml,
keyword AS k
WHERE (cct1.kind = 'cast' AND t.production_year > 2000 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND k.keyword IN ('superhero', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence', 'magnet', 'web', 'claw', 'laser') AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct1.id = cc.subject_id AND cn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND mc.company_id = ci.person_role_id AND ci.movie_id = ml.linked_movie_id AND mc.movie_id = ml.linked_movie_id AND k.id = mk.keyword_id AND t.id = mc.movie_id AND t.id = ml.linked_movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mk.movie_id AND cc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id)
