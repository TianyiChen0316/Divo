--{"gen": "combine", "time": "/", "template": "16b", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
char_name AS chn,
role_type AS rt
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND rt.role = 'actress' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id)
