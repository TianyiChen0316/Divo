--{"gen": "combine", "time": "/", "template": "generated-15135ed2-2391-463c-bafc-721d8f17f865", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS western_dark_production
FROM info_type AS it1,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
aka_name AS an,
cast_info AS ci,
keyword AS k,
movie_companies AS mc
WHERE (it1.info = 'release dates' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 2010 AND (t.title LIKE '%murder%' OR t.title LIKE '%Murder%' OR t.title LIKE '%Mord%') AND an.name LIKE '%a%' AND k.keyword = 'character-name-in-title' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND it1.id = mi.info_type_id AND t.id = ci.movie_id AND an.person_id = ci.person_id AND mc.movie_id = t.id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)
