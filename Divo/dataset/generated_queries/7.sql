--{"gen": "combine", "time": "/", "template": "generated-f8607d84-df06-4be3-b182-f73b7b08576e", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
title AS t,
cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
movie_info_idx AS mi_idx,
aka_title AS at,
info_type AS it1,
movie_info AS mi
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2008 AND ci.note LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND k.keyword = 'character-name-in-title' AND it1.info = 'votes' AND mi.note LIKE '%internet%' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND n.id = ci.person_id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND it1.id = mi.info_type_id AND mk.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND at.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
