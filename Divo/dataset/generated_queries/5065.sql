--{"gen": "erase", "time": "/", "template": "generated-11b950db-3ac1-44ee-83b1-a912ec838235", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_dynamic_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
char_name AS chn,
cast_info AS ci,
movie_keyword AS mk,
title AS t
WHERE (cct1.kind = 'cast' AND cct2.kind LIKE 'complete%' AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND t.production_year > 2000 AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id)
