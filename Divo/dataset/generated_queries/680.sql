--{"gen": "combine", "time": "/", "template": "2b", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
complete_cast AS cc,
cast_info AS ci,
movie_info AS mi,
person_info AS pi,
role_type AS rt
WHERE (k.keyword = 'character-name-in-title' AND ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%200%' OR mi.info LIKE 'USA:%200%') AND rt.role = 'actress' AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND rt.id = ci.role_id AND ci.person_id = pi.person_id AND ci.movie_id = mk.movie_id AND cc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id)
