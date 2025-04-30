--{"gen": "erase", "time": "/", "template": "generated-c0334fff-7680-44c0-811d-537625f1095e", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
movie_companies AS mc,
title AS t,
complete_cast AS cc,
movie_info_idx AS mi_idx2,
movie_info AS mi
WHERE (ct.kind = 'production companies' AND mc.note LIKE '%(VHS)%' AND t.production_year > 2008 AND mi_idx2.info > '3.0' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mi.movie_id = t.id AND mi.movie_id = mc.movie_id AND mi.info_type_id = mi_idx2.info_type_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id)
