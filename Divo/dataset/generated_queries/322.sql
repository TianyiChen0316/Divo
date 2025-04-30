--{"gen": "combine", "time": "/", "template": "6a", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS actor_name,
min(t.title) AS marvel_movie
FROM cast_info AS ci,
movie_keyword AS mk,
name AS n,
title AS t,
company_name AS cn,
company_type AS ct,
link_type AS lt,
movie_companies AS mc,
movie_link AS ml
WHERE (n.name LIKE '%Downey%Robert%' AND t.production_year > 2010 AND cn.country_code <> '[pl]' AND (cn.name LIKE '20th Century Fox%' OR cn.name LIKE 'Twentieth Century Fox%') AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND mc.note IS NOT NULL AND t.id = mk.movie_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id)
