--{"gen": "combine", "time": "/", "template": "generated-36a72c0a-9027-4617-90b8-cdfef7cbef5f", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
info_type AS it1,
movie_info AS mi,
person_info AS pi
WHERE (cn.country_code = '[de]' AND it1.info = 'mini biography' AND mi.info = 'Horror' AND lower(pi.info) LIKE '%japan%' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND ci.person_id = pi.person_id AND t.id = ci.movie_id AND t.id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id)
