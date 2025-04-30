--{"gen": "combine", "time": "/", "template": "generated-c1bc3b76-f990-4d48-8f79-2f22c275bca5", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating,
min(t.title) AS movie_title
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_info AS mi,
keyword AS k,
name AS n
WHERE (mi_idx.info > '2.0' AND t.production_year > 2005 AND ci.note LIKE '%(producer)%' AND cn.country_code = '[ru]' AND mi.info ILIKE '%romance%' AND k.keyword = 'character-name-in-title' AND n.name LIKE 'B%' AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND cn.id = mc.company_id AND mi.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n.id = ci.person_id AND mk.keyword_id = k.id)
