--{"gen": "combine", "time": "/", "template": "2d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
info_type AS it1,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND it1.info = 'budget' AND kt.kind = 'movie' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info > '6.0' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND kt.id = t.kind_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND it1.id = mi.info_type_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id)
