--{"gen": "erase", "time": "/", "template": "generated-b0605372-8100-4c2b-be15-5ae76d7e68dc", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS internet_movie
FROM aka_title AS at,
company_type AS ct,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx
WHERE (mc.note LIKE '%(200%)%' AND mc.note LIKE '%(worldwide)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND t.production_year > 2000 AND mi_idx.info > '3.0' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND ct.id = mc.company_type_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
