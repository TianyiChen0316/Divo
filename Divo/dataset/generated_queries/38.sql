--{"gen": "combine", "time": "/", "template": "generated-74adec82-af4b-48eb-ac03-b63d3b8f66ae", "dataset": "full_job", "rows": null}
SELECT *
FROM movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
keyword AS k,
link_type AS lt,
movie_link AS ml,
title AS t1,
company_name AS cn,
company_type AS ct,
name AS n,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
person_info AS pi
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND k.keyword = 'character-name-in-title' AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind = 'production companies' AND it1.id = 3 AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND mk.keyword_id = k.id AND t1.id = mk.movie_id AND ml.movie_id = t1.id AND lt.id = ml.link_type_id AND mk.movie_id = t1.id AND ml.movie_id = mk.movie_id AND mc.movie_id = ml.movie_id AND mc.movie_id = t1.id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = mi.movie_id AND t1.id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ci.person_id = n.id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND t1.id = ci.movie_id AND ci.movie_id = mk.movie_id)
