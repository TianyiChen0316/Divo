--{"gen": "erase", "time": "/", "template": "generated-708f2dd3-d5c1-4cd8-8602-bf0f81cfa073", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
role_type AS rt
WHERE (mi_idx.info > '3.0' AND cn.country_code = '[us]' AND rt.role = 'costume designer' AND mk.movie_id = mi_idx.movie_id AND mc.company_id = cn.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND mc.movie_id = mk.movie_id AND mc.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mi_idx.movie_id)
