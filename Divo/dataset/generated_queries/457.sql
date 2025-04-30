--{"gen": "combine", "time": "/", "template": "generated-4429c478-0d0d-4060-b0fc-3557615723fc", "dataset": "full_job", "rows": null}
SELECT min(k.keyword) AS movie_keyword,
min(n.name) AS actor_name
FROM cast_info AS ci,
keyword AS k,
movie_keyword AS mk,
name AS n,
company_name AS cn,
movie_companies AS mc,
title AS t,
char_name AS chn
WHERE (k.keyword IN ('superhero', 'sequel', 'second-part', 'marvel-comics', 'based-on-comic', 'tv-special', 'fight', 'violence') AND n.name LIKE '%Yo%' AND cn.country_code = '[nl]' AND k.id = mk.keyword_id AND ci.movie_id = mk.movie_id AND n.id = ci.person_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND chn.id = ci.person_role_id AND ci.movie_id = mc.movie_id)
