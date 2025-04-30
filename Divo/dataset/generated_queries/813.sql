--{"gen": "erase", "time": "/", "template": "generated-3431a74a-306b-43d4-b5eb-9ed66c2744f7", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS kung_fu_panda
FROM cast_info AS ci,
movie_companies AS mc,
movie_info AS mi,
role_type AS rt,
title AS t
WHERE (ci.note = '(voice)' AND mc.note LIKE '%(200%)%' AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND mi.info IS NOT NULL AND (mi.info LIKE 'Japan:%2007%' OR mi.info LIKE 'USA:%2008%') AND rt.role = 'actress' AND t.production_year > 2014 AND t.title LIKE '%Money%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mi.movie_id = ci.movie_id AND rt.id = ci.role_id)
