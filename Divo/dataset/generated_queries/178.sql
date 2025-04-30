--{"gen": "combine", "time": "/", "template": "e1a", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year)
FROM cast_info AS ci,
title AS t,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
complete_cast AS cc
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mc.note IS NULL AND mi.info IN ('Germany', 'German') AND ci.movie_id = t.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = mi.movie_id AND t.id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND ci.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND ml.movie_id = cc.movie_id AND mc.company_id = ci.person_role_id)
