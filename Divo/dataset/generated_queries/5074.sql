--{"gen": "combine", "time": "/", "template": "generated-d3f925fb-c355-423e-8a6b-0517cf31f234", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM info_type AS it,
movie_companies AS mc,
movie_info AS mi,
title AS t,
movie_keyword AS mk,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
person_info AS pi,
company_name AS cn,
company_type AS ct,
keyword AS k,
movie_info_idx AS mi_idx
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND it1.id = 3 AND lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%japan%' AND cn.country_code <> '[us]' AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND mi_idx.info < '7.0' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND it.id = mi.info_type_id AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND pi.info_type_id = it2.id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND it1.id = it.id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it2.id = mi_idx.info_type_id AND ct.id = mc.company_type_id AND cn.id = mc.company_id AND mi_idx.info_type_id = pi.info_type_id AND ci.movie_id = mi_idx.movie_id)
