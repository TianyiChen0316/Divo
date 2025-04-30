--{"gen": "erase", "time": "/", "template": "generated-0a2c606c-63fe-4d1d-ac2d-bf618e719dc2", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_us_internet_movie
FROM company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t
WHERE (cn.country_code = '[us]' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year > 1990 AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND k.id = mk.keyword_id AND cn.id = mc.company_id)
