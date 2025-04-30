--{"gen": "combine", "time": "/", "template": "generated-ee82c78e-b62d-4ec0-a472-2835fe4d80e3", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
movie_link AS ml,
info_type AS it,
keyword AS k,
movie_info_idx AS mi_idx,
name AS n,
person_info AS pi
WHERE (ci.role_id = 1 AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND mc.note IS NULL AND mi.info IN ('Germany', 'German') AND it.info = 'rating' AND k.keyword LIKE '%sequel%' AND mi_idx.info > '9.0' AND lower(pi.info) LIKE '%india%' AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mk.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = ci.movie_id AND mc.movie_id = ci.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND k.id = mk.keyword_id AND it.id = mi_idx.info_type_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND ci.person_id = pi.person_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id)
