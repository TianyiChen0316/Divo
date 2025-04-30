--{"gen": "erase", "time": "/", "template": "generated-5a8096ca-8087-466b-ab38-d5de068a7296", "dataset": "full_job", "rows": null}
SELECT min(mi_idx.info) AS rating
FROM movie_info_idx AS mi_idx,
movie_keyword AS mk,
company_type AS ct,
info_type AS it2,
movie_companies AS mc,
movie_info AS mi
WHERE (mi_idx.info > '5.0' AND ct.kind IS NOT NULL AND (ct.kind = 'production companies' OR ct.kind = 'distributors') AND it2.info = 'genres' AND mk.movie_id = mi_idx.movie_id AND mi_idx.info_type_id = it2.id AND ct.id = mc.company_type_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mk.movie_id AND mk.movie_id = mi.movie_id)
