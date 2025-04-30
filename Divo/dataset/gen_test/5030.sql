--{"gen": "erase", "time": "/", "template": "generated-d66dcdc2-3288-4ec8-87d6-dcb6d15857e1", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_downey_ironman_movie
FROM complete_cast AS cc,
comp_cast_type AS cct2,
char_name AS chn,
cast_info AS ci,
keyword AS k,
kind_type AS kt,
movie_keyword AS mk,
title AS t,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_link AS ml
WHERE (cct2.kind LIKE 'complete%' AND chn.name NOT LIKE '%Sherlock%' AND (chn.name LIKE '%Tony%Stark%' OR chn.name LIKE '%Iron%Man%') AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND kt.kind = 'movie' AND t.production_year BETWEEN 2000 AND 2010 AND ct.kind = 'production companies' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND kt.id = t.kind_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mk.movie_id = ci.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND chn.id = ci.person_role_id AND k.id = mk.keyword_id AND cct2.id = cc.status_id AND ml.movie_id = t.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mi.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id)
