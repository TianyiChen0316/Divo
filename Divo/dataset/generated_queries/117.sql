--{"gen": "erase", "time": "/", "template": "generated-bda9ebef-9d5b-4a49-aba5-a47cb5416d90", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM info_type AS it,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi,
name AS n,
cast_info AS ci,
person_info AS pi,
char_name AS chn,
company_name AS cn,
role_type AS rt
WHERE (it.info = 'rating' AND mi_idx.info < '3.0' AND t.production_year > 2005 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND lower(pi.info) LIKE '%japan%' AND cn.country_code = '[us]' AND rt.role = 'costume designer' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND ci.person_id = n.id AND pi.person_id = n.id AND ci.movie_id = mk.movie_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mi_idx.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND chn.id = ci.person_role_id)
