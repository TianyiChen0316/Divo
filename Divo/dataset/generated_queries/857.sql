--{"gen": "combine", "time": "/", "template": "generated-994dee01-e18e-4478-a297-b4cbb39be70f", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
aka_name AS an1,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
name AS n1,
role_type AS rt,
keyword AS k,
char_name AS chn,
info_type AS it1,
movie_info AS mi
WHERE (mi_idx.info > '9.0' AND t.production_year > 2010 AND cn.country_code = '[us]' AND rt.role = 'costume designer' AND k.keyword = 'character-name-in-title' AND it1.info = 'genres' AND mi.info IN ('Drama', 'Horror') AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND mk.keyword_id = k.id AND chn.id = ci.person_role_id AND t.id = mi.movie_id AND mi.info_type_id = it1.id AND mc.movie_id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id)
