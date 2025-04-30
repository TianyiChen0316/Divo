--{"gen": "erase", "time": "/", "template": "generated-3fff0688-f6a0-480b-a00b-7ac4fdcf3e0f", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM movie_companies AS mc,
movie_link AS ml,
title AS t,
complete_cast AS cc,
cast_info AS ci,
movie_info AS mi,
name AS n,
movie_info_idx AS miidx,
char_name AS chn,
role_type AS rt,
person_info AS pi
WHERE (mc.note IS NOT NULL AND t.production_year > 1950 AND mi.info IN ('Horror', 'Thriller') AND n.gender = 'm' AND rt.role = 'costume designer' AND lower(pi.info) LIKE '%japan%' AND ml.movie_id = t.id AND t.id = mc.movie_id AND ml.movie_id = mc.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = cc.movie_id AND n.id = ci.person_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = cc.movie_id AND ci.role_id = rt.id AND chn.id = ci.person_role_id AND pi.person_id = n.id AND ci.person_id = pi.person_id AND miidx.movie_id = ml.movie_id AND ml.movie_id = mi.movie_id)
