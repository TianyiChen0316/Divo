--{"gen": "combine", "time": "/", "template": "generated-45989eb0-30b7-4f8a-b8c8-18b823ae3fe3", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
aka_title AS at,
movie_info AS mi,
movie_keyword AS mk,
aka_name AS an1,
cast_info AS ci,
name AS n1,
role_type AS rt,
keyword AS k,
name AS n
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2005 AND 2010 AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND rt.role = 'actor' AND k.keyword LIKE '%sequel%' AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND k.id = mk.keyword_id AND n.id = ci.person_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND an1.person_id = n.id AND n.id = n1.id AND at.movie_id = ci.movie_id AND ci.movie_id = mi_idx.movie_id)
