--{"gen": "combine", "time": "/", "template": "generated-c911954b-dfed-4bdb-b4e8-9e1c6a3146ee", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx,
cast_info AS ci,
company_name AS cn,
role_type AS rt,
keyword AS k,
movie_keyword AS mk,
name AS n,
title AS t,
info_type AS it1,
info_type AS it2,
movie_info AS mi
WHERE (it.info = 'bottom 10 rank' AND mc.note LIKE '%(France)%' AND ci.note LIKE '%(uncredited)%' AND ci.note LIKE '%(uncredited)%' AND cn.country_code = '[ru]' AND rt.role = 'costume designer' AND k.keyword = 'character-name-in-title' AND n.name LIKE '%An%' AND it1.info = 'genres' AND it2.info = 'rating' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND ci.movie_id = mc.movie_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ci.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = mi.movie_id AND mi.info_type_id = it1.id AND mi_idx.info_type_id = it2.id AND mc.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND it2.id = it.id)
