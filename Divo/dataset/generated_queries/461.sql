--{"gen": "combine", "time": "/", "template": "2d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND mi_idx.info > '3.0' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi_idx.movie_id = mc.movie_id)
