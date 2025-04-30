--{"gen": "erase", "time": "/", "template": "2b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
title AS t
WHERE (cn.country_code = '[hk]' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id)
