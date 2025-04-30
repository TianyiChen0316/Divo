--{"gen": "combine", "time": "/", "template": "generated-947b8f80-f796-43af-8e44-17a27980ea8c", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
info_type AS it1,
movie_info_idx AS mi_idx,
char_name AS chn,
movie_companies AS mc,
company_name AS cn,
name AS n
WHERE (k.keyword LIKE '%sequel%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND it1.info = 'genres' AND cn.country_code = '[jp]' AND t.id = mi.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND mc.company_id = cn.id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id)
