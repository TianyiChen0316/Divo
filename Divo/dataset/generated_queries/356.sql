--{"gen": "erase", "time": "/", "template": "generated-f9d19838-e79d-4e43-973c-4ae288ab1f6e", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS from_company
FROM company_name AS cn,
company_type AS ct,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
cast_info AS ci,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND ct.kind = 'production companies' AND mc.note IS NULL AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND mi_idx.info < '8.5' AND mc.company_type_id = ct.id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mc.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id)
