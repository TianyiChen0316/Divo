--{"gen": "combine", "time": "/", "template": "17c", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
info_type AS it,
movie_info AS mi
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE 'X%' AND it.id = 3 AND lower(mi.info) LIKE '%action%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)
