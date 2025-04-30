--{"gen": "combine", "time": "/", "template": "2d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
movie_info AS mi
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id)
