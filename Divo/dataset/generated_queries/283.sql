--{"gen": "combine", "time": "/", "template": "17f", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
company_type AS ct,
info_type AS it,
movie_info_idx AS mi_idx
WHERE (k.keyword = 'character-name-in-title' AND n.name LIKE '%B%' AND ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND ci.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id)
