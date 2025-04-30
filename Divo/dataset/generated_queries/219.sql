--{"gen": "erase", "time": "/", "template": "generated-2767001f-c083-4b67-88ea-039a1f362ce5", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
role_type AS rt
WHERE (cn.country_code = '[sm]' AND k.keyword = 'character-name-in-title' AND ci.note = '(voice: English version)' AND rt.role = 'actor' AND cn.id = mc.company_id AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id)
