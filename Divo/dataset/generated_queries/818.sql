--{"gen": "combine", "time": "/", "template": "2d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
info_type AS it,
movie_info AS mi
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND it.id = 3 AND mi.info ILIKE '%romance%' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mi.movie_id = mk.movie_id AND mc.movie_id = mi.movie_id)
