--{"gen": "combine", "time": "/", "template": "16d", "dataset": "full_job", "rows": null}
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
movie_info AS mi,
company_type AS ct,
link_type AS lt,
movie_link AS ml
WHERE (cn.country_code = '[us]' AND k.keyword = 'character-name-in-title' AND t.episode_nr >= 5 AND t.episode_nr < 100 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND ct.kind <> 'production companies' AND ct.kind IS NOT NULL AND an.person_id = n.id AND n.id = ci.person_id AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND mc.movie_id = mi.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND lt.id = ml.link_type_id AND ml.movie_id = t.id AND mc.company_type_id = ct.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id)
