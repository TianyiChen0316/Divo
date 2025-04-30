--{"gen": "erase", "time": "/", "template": "generated-1d783fdb-c8d4-4b5c-9958-60e6dcdfdaf3", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t
WHERE (n.name LIKE 'Z%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)
