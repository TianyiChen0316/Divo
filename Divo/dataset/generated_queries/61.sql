--{"gen": "combine", "time": "/", "template": "17a", "dataset": "full_job", "rows": null}
SELECT min(n.name) AS member_in_charnamed_american_movie,
min(n.name) AS a1
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
char_name AS chn,
role_type AS rt
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND n.name LIKE 'B%' AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id)
