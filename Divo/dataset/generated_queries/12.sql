--{"gen": "combine", "time": "/", "template": "generated-6b887ab5-4772-48b4-9714-27d17d3c2670", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
company_name AS cn,
title AS t
WHERE (k.keyword = 'character-name-in-title' AND cn.country_code = '[sm]' AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND ci.movie_id = t.id)
