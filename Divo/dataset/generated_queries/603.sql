--{"gen": "erase", "time": "/", "template": "generated-4d66f91f-9b49-4800-98b4-01ceb39c53a5", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
info_type AS it,
info_type AS it2,
movie_info_idx AS miidx,
aka_name AS an,
cast_info AS ci,
company_name AS cn,
movie_keyword AS mk
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year BETWEEN 2005 AND 2015 AND it.info = 'rating' AND it2.info = 'release dates' AND ci.note = '(voice)' AND cn.country_code = '[us]' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND it2.id = mi.info_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND t.id = ci.movie_id AND mc.movie_id = ci.movie_id AND mi.movie_id = ci.movie_id AND cn.id = mc.company_id AND ci.person_id = an.person_id AND miidx.movie_id = ci.movie_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND miidx.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND ci.movie_id = mk.movie_id)
