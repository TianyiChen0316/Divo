--{"gen": "combine", "time": "/", "template": "1b", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info_idx AS mi_idx,
title AS t,
movie_keyword AS mk,
keyword AS k,
movie_info AS mi,
company_name AS cn
WHERE (ct.kind = 'production companies' AND it.info = 'bottom 10 rank' AND mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year BETWEEN 2005 AND 2010 AND lower(k.keyword) LIKE '%fight%' AND lower(mi.info) LIKE '%action%' AND cn.country_code = '[ru]' AND ct.id = mc.company_type_id AND t.id = mc.movie_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND it.id = mi_idx.info_type_id AND it.id = mi.info_type_id AND mi.movie_id = t.id AND mk.keyword_id = k.id AND mk.movie_id = t.id AND mk.movie_id = mi.movie_id AND cn.id = mc.company_id AND mc.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi.info_type_id = mi_idx.info_type_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
