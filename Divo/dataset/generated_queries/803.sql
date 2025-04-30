--{"gen": "combine", "time": "/", "template": "generated-ee82c78e-b62d-4ec0-a472-2835fe4d80e3", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
info_type AS it,
info_type AS it2,
movie_info_idx AS miidx,
title AS t
WHERE (ci.role_id = 1 AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind = 'production companies' AND mc.note IS NULL AND mi.info IN ('Germany', 'German') AND it.info = 'release dates' AND it2.info = 'release dates' AND t.title <> '' AND (t.title LIKE 'Champion%' OR t.title LIKE 'Loser%') AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = t.id AND it2.id = mi.info_type_id AND mc.movie_id = t.id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ml.movie_id AND t.id = ci.movie_id AND t.id = mk.movie_id AND miidx.movie_id = ml.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)
