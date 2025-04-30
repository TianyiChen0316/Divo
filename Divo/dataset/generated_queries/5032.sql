--{"gen": "combine", "time": "/", "template": "generated-d3f925fb-c355-423e-8a6b-0517cf31f234", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM info_type AS it,
movie_companies AS mc,
movie_info AS mi,
title AS t,
movie_keyword AS mk,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
person_info AS pi,
link_type AS lt,
movie_link AS ml,
title AS t1,
title AS t2
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND it1.id = 3 AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND it1.id = it.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND ml.linked_movie_id = t2.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND t.id = ml.movie_id AND t.id = t1.id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND ml.movie_id = ci.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi.movie_id AND t1.id = ci.movie_id AND t1.id = mi.movie_id)
