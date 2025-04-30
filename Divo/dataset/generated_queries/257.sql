--{"gen": "erase", "time": "/", "template": "generated-0f5769a2-ffae-42ec-b0a4-52c4f182e69a", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_movie
FROM company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
title AS t,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
person_info AS pi,
aka_name AS an,
movie_keyword AS mk,
name AS n,
movie_link AS ml
WHERE (ct.kind = 'production companies' AND mc.note LIKE '%(worldwide)%' AND mc.note LIKE '%(VHS)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year BETWEEN 2000 AND 2005 AND it1.id = 3 AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND t.id = ci.movie_id AND it1.id = mi.info_type_id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mc.movie_id AND an.person_id = n.id AND n.id = ci.person_id AND t.id = mk.movie_id AND an.person_id = ci.person_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND n.id = pi.person_id AND ml.linked_movie_id = t.id AND pi.person_id = an.person_id AND ci.movie_id = ml.linked_movie_id AND mi.movie_id = mk.movie_id AND mc.movie_id = ml.linked_movie_id AND mk.movie_id = ml.linked_movie_id AND mi.movie_id = ml.linked_movie_id)
