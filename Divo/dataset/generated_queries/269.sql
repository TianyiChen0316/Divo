--{"gen": "combine", "time": "/", "template": "32a", "dataset": "full_job", "rows": null}
SELECT min(t1.title) AS first_movie
FROM movie_link AS ml,
title AS t1,
complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
info_type AS it3,
movie_companies AS mc,
movie_info AS mi,
person_info AS pi,
title AS t
WHERE (cct2.kind = 'complete' AND ci.note IN ('(voice)', '(voice) (uncredited)', '(voice: English version)') AND it3.info = 'height' AND mi.info ILIKE '%sci%' AND t.title = 'Shrek 2' AND t.production_year BETWEEN 2000 AND 2005 AND ml.movie_id = t1.id AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = ci.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND ci.person_id = pi.person_id AND it3.id = pi.info_type_id AND cct2.id = cc.status_id AND t.id = ml.movie_id AND t.id = t1.id AND ml.movie_id = mc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = t1.id AND t1.id = ci.movie_id AND t1.id = cc.movie_id AND t1.id = mi.movie_id)
