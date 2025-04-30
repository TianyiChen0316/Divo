--{"gen": "combine", "time": "/", "template": "generated-4e3c744e-2cb4-433a-a487-8d61ed7c93fc", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS uncredited_voiced_character,
min(t.title)
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
title AS t,
company_name AS cn,
keyword AS k,
movie_keyword AS mk,
name AS n
WHERE (ci.note NOT LIKE '%(voice)%' AND ci.note LIKE '%(uncredited)%' AND t.production_year > 2010 AND cn.country_code = '[sm]' AND k.keyword = 'character-name-in-title' AND n.name LIKE 'Z%' AND t.id = mc.movie_id AND t.id = ci.movie_id AND ci.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND n.id = ci.person_id AND mk.keyword_id = k.id AND mc.company_id = cn.id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mk.movie_id)
