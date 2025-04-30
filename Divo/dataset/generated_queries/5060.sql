--{"gen": "combine", "time": "/", "template": "generated-3c46f434-93a3-4f35-b885-7bc406c07c63", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
aka_name AS an1,
cast_info AS ci,
name AS n1,
role_type AS rt
WHERE (cn.country_code = '[de]' AND k.keyword = 'character-name-in-title' AND rt.role = 'costume designer' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id)
