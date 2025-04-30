--{"gen": "erase", "time": "/", "template": "generated-3e2be11f-f060-43f8-b077-7cd66ca6fa9e", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
title AS t,
movie_info AS mi,
movie_info_idx AS miidx,
complete_cast AS cc,
comp_cast_type AS cct1,
cast_info AS ci,
movie_link AS ml
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 1980 AND 1995 AND cct1.kind = 'cast' AND t.id = mc.movie_id AND mi.movie_id = t.id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct1.id = cc.subject_id AND ml.movie_id = t.id AND ml.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = cc.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = cc.movie_id AND ci.movie_id = mi.movie_id AND cc.movie_id = mi.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = cc.movie_id)
