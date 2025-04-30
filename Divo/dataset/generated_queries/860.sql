--{"gen": "erase", "time": "/", "template": "generated-385c1992-1ff2-4937-ab8c-f1fbb978d21f", "dataset": "full_job", "rows": null}
SELECT min(pi.info)
FROM person_info AS pi,
info_type AS it1,
info_type AS it2,
name AS n,
cast_info AS ci,
movie_info AS mi,
company_name AS cn,
movie_companies AS mc,
movie_link AS ml
WHERE (it2.id = 3 AND lower(mi.info) LIKE '%documentary%' AND lower(it1.info) LIKE 'birth date' AND (lower(pi.info) LIKE '%189%' OR lower(pi.info) LIKE '188%' OR lower(pi.info) LIKE '187%' OR lower(pi.info) LIKE '186%' OR lower(pi.info) LIKE '185%' OR lower(pi.info) LIKE '184%') AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND mc.note IS NULL AND mi.info_type_id = it2.id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it1.id AND mc.company_id = cn.id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.person_id = pi.person_id)
