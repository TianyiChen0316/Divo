--{"gen": "erase", "time": "/", "template": "generated-6c90d019-2bad-40d9-a424-0d791acebfdb", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_nerdy_internet_movie
FROM complete_cast AS cc,
company_name AS cn,
info_type AS it1,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx
WHERE (cn.country_code = '[us]' AND it1.info = 'height' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND t.production_year > 1950 AND mi_idx.info < '3.5' AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND it1.id = mi.info_type_id AND cn.id = mc.company_id AND t.id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND cc.movie_id = mi_idx.movie_id)
