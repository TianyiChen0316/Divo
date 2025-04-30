--{"gen": "combine", "time": "/", "template": "15c", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS modern_american_internet_movie
FROM aka_title AS at,
company_type AS ct,
info_type AS it1,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
aka_name AS an,
cast_info AS ci,
complete_cast AS cc,
comp_cast_type AS cct2,
kind_type AS kt
WHERE (it1.info = 'release dates' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year > 1990 AND cct2.kind LIKE 'complete%' AND kt.kind = 'movie' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND ct.id = mc.company_type_id AND ci.movie_id = t.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = cc.movie_id AND mk.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id AND at.movie_id = ci.movie_id AND at.movie_id = cc.movie_id)
