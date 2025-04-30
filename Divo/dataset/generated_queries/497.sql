--{"gen": "combine", "time": "/", "template": "generated-57575eb2-6915-42ef-83b3-f29da6c7ec05", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
movie_info AS mi,
info_type AS it1,
info_type AS it2,
person_info AS pi
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE '%B%' AND it1.id = 3 AND lower(mi.info) LIKE '%adult%' AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND it1.id = mi.info_type_id AND pi.person_id = n.id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
