--{"gen": "combine", "time": "/", "template": "e1a", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS miidx,
char_name AS chn
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND chn.name IS NOT NULL AND (chn.name LIKE '%man%' OR chn.name LIKE '%Man%') AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND chn.id = ci.person_role_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND cn.id = chn.id)
