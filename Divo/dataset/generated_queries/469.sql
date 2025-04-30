--{"gen": "combine", "time": "/", "template": "e1b", "dataset": "full_job", "rows": null}
SELECT min(t.title),
max(t.production_year),
min(chn.name)
FROM cast_info AS ci,
title AS t,
char_name AS chn,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (t.kind_id = 3 AND ci.role_id = 1 AND cn.country_code = '[hk]' AND k.keyword = 'character-name-in-title' AND ci.movie_id = t.id AND chn.id = ci.person_role_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id)
