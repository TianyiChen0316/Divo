--{"gen": "erase", "time": "/", "template": "generated-0f2ea40c-41c0-4c1e-a077-519e2e415cd9", "dataset": "full_job", "rows": null}
SELECT min(chn.name) AS voiced_character,
min(n.name) AS voicing_actress,
min(t.title) AS american_movie
FROM char_name AS chn,
cast_info AS ci,
movie_companies AS mc,
name AS n,
role_type AS rt,
title AS t,
info_type AS it1,
movie_info AS mi,
person_info AS pi,
company_type AS ct,
movie_link AS ml
WHERE (ci.note = '(voice)' AND mc.note LIKE '%(200%)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'm' AND n.name LIKE '%Bert%' AND rt.role = 'actress' AND t.production_year BETWEEN 1950 AND 2000 AND lower(pi.info) LIKE '%india%' AND lower(it1.info) LIKE '%count%' AND lower(mi.info) LIKE '%usa%' AND ct.kind = 'production companies' AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.role_id = rt.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND n.id = pi.person_id AND mi.info_type_id = it1.id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = mc.movie_id AND ci.person_id = pi.person_id AND ml.movie_id = t.id AND mc.company_type_id = ct.id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id)
