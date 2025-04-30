--{"gen": "combine", "time": "/", "template": "e1b", "dataset": "full_job", "rows": null}
SELECT min(t.title),
max(t.production_year),
min(chn.name)
FROM cast_info AS ci,
title AS t,
char_name AS chn,
movie_companies AS mc,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (t.kind_id = 3 AND ci.role_id = 1 AND mi.info IN ('Drama', 'Horror', 'Western', 'Family') AND mi_idx.info > '9.0' AND ci.movie_id = t.id AND chn.id = ci.person_role_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mc.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mc.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id)
