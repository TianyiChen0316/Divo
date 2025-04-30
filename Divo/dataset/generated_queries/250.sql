--{"gen": "combine", "time": "/", "template": "generated-bea1da27-c3fe-4c88-82b7-74aaeb2e9e71", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_link AS ml,
title AS t1,
cast_info AS ci,
aka_title AS at,
company_name AS cn,
info_type AS it1,
movie_companies AS mc,
keyword AS k,
name AS n
WHERE (mi.info IN ('Bulgaria') AND t.production_year > 2010 AND cn.country_code = '[us]' AND it1.info = 'release dates' AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%Bert%' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND mk.movie_id = ml.movie_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = at.movie_id AND t.id = mc.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND mc.movie_id = ci.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = at.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = t1.id AND t1.id = at.movie_id AND t1.id = ci.movie_id AND k.id = mk.keyword_id AND n.id = ci.person_id)
