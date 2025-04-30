--{"gen": "combine", "time": "/", "template": "e8b", "dataset": "full_job", "rows": null}
SELECT count(*)
FROM title AS t,
movie_keyword AS mk,
movie_info AS mi,
complete_cast AS cc,
comp_cast_type AS cct1,
company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_link AS ml
WHERE (lower(mi.info) LIKE '%action%' AND cct1.kind IN ('cast', 'crew') AND cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind = 'production companies' AND mc.note IS NULL AND mi.movie_id = t.id AND mk.movie_id = t.id AND ml.movie_id = t.id AND t.id = mc.movie_id AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND t.id = cc.movie_id AND cct1.id = cc.subject_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ml.movie_id = mi.movie_id AND mc.movie_id = mi.movie_id AND ml.movie_id = cc.movie_id AND mk.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND mk.movie_id = mi.movie_id)
