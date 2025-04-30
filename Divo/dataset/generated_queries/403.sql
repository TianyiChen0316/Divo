--{"gen": "combine", "time": "/", "template": "generated-d18d62e8-9c4e-4499-90be-92422bb333bb", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_keyword AS mk,
title AS t,
movie_companies AS mc,
movie_info AS mi,
complete_cast AS cc,
comp_cast_type AS cct1,
cast_info AS ci,
name AS n,
person_info AS pi
WHERE (t.production_year > 2005 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND cct1.kind = 'cast' AND ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND n.gender = 'm' AND n.name LIKE '%Ang%' AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND mi.movie_id = mc.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mk.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND n.id = ci.person_id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND cct1.id = cc.subject_id)
