--{"gen": "erase", "time": "/", "template": "1c", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx
WHERE (ct.kind = 'production companies' AND it.info = 'mini biography' AND mc.note LIKE '%(Blu-ray)%' AND mc.note LIKE '%(co-production)%' AND ct.id = mc.company_type_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id)
