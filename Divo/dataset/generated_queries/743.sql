--{"gen": "combine", "time": "/", "template": "generated-d1d25e04-1bad-4c30-87b6-cd47e1ad7ffc", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS character,
min(t.title) AS movie_with_american_producer
FROM char_name AS chn,
cast_info AS ci,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
role_type AS rt,
title AS t,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
info_type AS it,
keyword AS k,
movie_info AS mi
WHERE (ci.note LIKE '%(producer)%' AND cn.country_code = '[us]' AND t.production_year > 1990 AND mi_idx.info > '3.0' AND it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND rt.id = ci.role_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND t.id = mi.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id)
