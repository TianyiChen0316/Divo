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
company_type AS ct,
info_type AS it2,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (t.kind_id = 1 AND ci.role_id = 2 AND mc.note IS NOT NULL AND (mc.note LIKE '%(USA)%' OR mc.note LIKE '%(worldwide)%') AND ct.kind = 'production companies' AND it2.info = 'release dates' AND kt.kind = 'movie' AND ci.movie_id = t.id AND cn.id = ci.person_role_id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mc.company_id = cn.id AND chn.id = ci.person_role_id AND an.person_id = ci.person_id AND cn.id = chn.id AND mc.company_id = chn.id AND mc.company_id = ci.person_role_id AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND kt.id = t.kind_id AND ct.id = mc.company_type_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND ci.movie_id = mi.movie_id)
