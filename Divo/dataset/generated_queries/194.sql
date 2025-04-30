--{"gen": "erase", "time": "/", "template": "generated-2aecd1c6-eace-4546-92b2-494adcf3fbed", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM movie_info AS mi,
title AS t,
movie_companies AS mc,
movie_link AS ml,
complete_cast AS cc,
comp_cast_type AS cct1,
aka_name AS an,
cast_info AS ci,
role_type AS rt
WHERE (mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND mc.note IS NOT NULL AND cct1.kind IN ('cast', 'crew') AND ci.note IN ('(voice)', '(voice: Japanese version)', '(voice) (uncredited)', '(voice: English version)') AND rt.role = 'actress' AND t.id = mi.movie_id AND ml.movie_id = t.id AND t.id = mc.movie_id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND t.id = cc.movie_id AND cct1.id = cc.subject_id AND ml.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND rt.id = ci.role_id AND ci.person_id = an.person_id AND ml.movie_id = ci.movie_id AND ci.movie_id = cc.movie_id)
