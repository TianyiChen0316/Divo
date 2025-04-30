--{"gen": "combine", "time": "/", "template": "generated-e822072c-fedc-4d47-9036-682e88451987", "dataset": "full_job", "rows": null}
SELECT min(at.title) AS aka_title,
min(t.title) AS internet_movie_title
FROM aka_title AS at,
company_name AS cn,
company_type AS ct,
info_type AS it1,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
info_type AS it,
movie_info_idx AS mi_idx,
complete_cast AS cc,
comp_cast_type AS cct2,
link_type AS lt,
movie_link AS ml
WHERE (cn.country_code = '[us]' AND it1.info = 'release dates' AND mi.note LIKE '%internet%' AND t.production_year > 1990 AND it.info = 'rating' AND mi_idx.info > '5.0' AND cct2.kind LIKE '%complete%' AND lt.link LIKE '%follow%' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = cc.movie_id AND cct2.id = cc.status_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ml.movie_id = at.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mi_idx.movie_id AND at.movie_id = cc.movie_id AND cc.movie_id = mk.movie_id AND cc.movie_id = mi_idx.movie_id)
