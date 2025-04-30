--{"gen": "combine", "time": "/", "template": "e1b", "dataset": "full_job", "rows": null}
SELECT min(t.title),
max(t.production_year)
FROM cast_info AS ci,
title AS t,
complete_cast AS cc,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml
WHERE (t.kind_id = 3 AND ci.role_id = 1 AND mc.note IS NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'English') AND ci.movie_id = t.id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mi.movie_id = t.id AND t.id = cc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = cc.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id)
