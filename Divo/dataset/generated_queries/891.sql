--{"gen": "combine", "time": "/", "template": "generated-a27b90b9-4248-459d-bdf8-739aeca9f3e5", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS movie_budget,
min(n.name) AS writer,
min(t.title) AS complete_gore_movie
FROM complete_cast AS cc,
cast_info AS ci,
movie_info AS mi,
movie_keyword AS mk,
name AS n,
title AS t,
company_name AS cn,
movie_companies AS mc,
aka_name AS an1,
name AS n1,
role_type AS rt
WHERE (ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND mi.info IN ('Horror', 'Thriller') AND n.gender = 'm' AND t.production_year > 2000 AND (t.title LIKE '%Freddy%' OR t.title LIKE '%Jason%' OR t.title LIKE 'Saw%') AND cn.country_code = '[de]' AND rt.role = 'actress' AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND cn.id = mc.company_id AND mc.movie_id = t.id AND mc.movie_id = mk.movie_id AND an1.person_id = n1.id AND n1.id = ci.person_id AND ci.role_id = rt.id AND an1.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mc.movie_id = cc.movie_id AND mc.movie_id = mi.movie_id AND an1.person_id = n.id AND n.id = n1.id)
