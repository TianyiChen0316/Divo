--{"gen": "combine", "time": "/", "template": "generated-76ae9792-57de-42b1-a051-922b8fae0bbd", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t
WHERE (cn.country_code = '[jp]' AND k.keyword = 'character-name-in-title' AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND ci.movie_id = t.id)
