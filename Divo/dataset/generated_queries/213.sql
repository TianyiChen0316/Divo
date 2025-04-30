--{"gen": "combine", "time": "/", "template": "e3b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS mainstream_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
complete_cast AS cc,
char_name AS chn,
cast_info AS ci,
movie_keyword AS mk,
role_type AS rt
WHERE (mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND t.production_year BETWEEN 2005 AND 2010 AND chn.name = 'Queen' AND ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND rt.role = 'actress' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND rt.id = ci.role_id AND chn.id = ci.person_role_id AND mc.movie_id = mi.movie_id)
