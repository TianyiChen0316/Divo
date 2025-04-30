--{"gen": "combine", "time": "/", "template": "generated-766661ca-811f-4651-ae2b-b6289de8e72b", "dataset": "full_job", "rows": null}
SELECT min(t.title),
min(t.production_year),
min(cn.name)
FROM cast_info AS ci,
title AS t,
char_name AS cn,
aka_name AS an,
char_name AS chn,
movie_companies AS mc,
name AS n,
movie_info_idx AS mi_idx,
movie_keyword AS mk
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND n.gender = 'f' AND n.name LIKE '%Ang%' AND mi_idx.info > '2.0' AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND n.id = ci.person_id AND chn.id = ci.person_role_id AND an.person_id = n.id AND an.person_id = ci.person_id AND cn.id = chn.id AND mc.company_id = chn.id AND mc.company_id = ci.person_role_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id)
