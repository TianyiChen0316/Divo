--{"gen": "erase", "time": "/", "template": "generated-c9941e8a-e835-4f65-a65b-0a37a9022882", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_dynamic_hero_movie
FROM complete_cast AS cc,
comp_cast_type AS cct1,
comp_cast_type AS cct2,
cast_info AS ci,
title AS t
WHERE (cct1.kind = 'cast' AND cct2.kind LIKE '%complete%' AND t.production_year > 2000 AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct1.id = cc.subject_id AND cct2.id = cc.status_id)
