--{"gen": "erase", "time": "/", "template": "generated-5f2faec6-b662-42ce-b1f7-9bada1d65e3a", "dataset": "full_job", "rows": null}
SELECT min(an.name) AS cool_actor_pseudonym,
min(t.title) AS series_named_after_char
FROM aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
name AS n,
title AS t,
role_type AS rt
WHERE (cn.country_code = '[us]' AND t.episode_nr >= 5 AND t.episode_nr < 100 AND rt.role = 'actress' AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.role_id = rt.id)
