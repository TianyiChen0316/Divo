--{"gen": "erase", "time": "/", "template": "generated-5707d228-d401-41aa-b087-1e6f55207b26", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS complete_downey_ironman_movie
FROM complete_cast AS cc,
comp_cast_type AS cct2,
cast_info AS ci,
title AS t,
aka_name AS an,
company_name AS cn,
movie_companies AS mc,
company_type AS ct,
movie_info AS mi,
info_type AS it
WHERE (cct2.kind LIKE 'complete%' AND t.production_year > 1950 AND cn.country_code = '[nl]' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Danish', 'Norwegian', 'German', 'USA', 'American') AND it.info = 'genres' AND t.id = ci.movie_id AND t.id = cc.movie_id AND ci.movie_id = cc.movie_id AND cct2.id = cc.status_id AND mc.company_id = cn.id AND an.person_id = ci.person_id AND ci.movie_id = mc.movie_id AND mi.movie_id = mc.movie_id AND ct.id = mc.company_type_id AND ci.movie_id = mi.movie_id AND t.id = mi.movie_id AND t.id = mc.movie_id AND it.id = mi.info_type_id AND mc.movie_id = cc.movie_id AND cc.movie_id = mi.movie_id)
