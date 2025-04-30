--{"gen": "combine", "time": "/", "template": "generated-c25ed4ee-2807-455a-b35f-1a29ee72960d", "dataset": "full_job", "rows": null}
SELECT min(n.name),
min(t.title)
FROM info_type AS it2,
title AS t,
cast_info AS ci,
name AS n,
person_info AS pi,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
char_name AS chn
WHERE (lower(it2.info) LIKE '%birth%' AND lower(pi.info) LIKE '%usa%' AND cn.country_code = '[sm]' AND k.keyword = 'character-name-in-title' AND t.id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND pi.info_type_id = it2.id AND pi.person_id = ci.person_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND chn.id = ci.person_role_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id)
