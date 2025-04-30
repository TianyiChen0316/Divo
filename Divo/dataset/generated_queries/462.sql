--{"gen": "combine", "time": "/", "template": "generated-9b7bd81c-a6e7-4857-b402-d193dbc0e4ab", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS from_company,
min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM company_name AS cn,
link_type AS lt,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
cast_info AS ci,
keyword AS k,
name AS n
WHERE (cn.country_code <> '[pl]' AND (cn.name LIKE '20th Century Fox%' OR cn.name LIKE 'Twentieth Century Fox%') AND mc.note IS NOT NULL AND t.production_year BETWEEN 1980 AND 1995 AND k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%Downey%Robert%' AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id)
