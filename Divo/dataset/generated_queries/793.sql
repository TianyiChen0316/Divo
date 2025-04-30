--{"gen": "combine", "time": "/", "template": "3a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
movie_companies AS mc,
info_type AS it2,
person_info AS pi
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND ci.note LIKE '%(producer)%' AND ci.note LIKE '%(uncredited)%' AND it2.info ILIKE '%count%' AND pi.info ILIKE '%india%' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = pi.person_id AND pi.info_type_id = it2.id)
