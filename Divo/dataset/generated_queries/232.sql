--{"gen": "erase", "time": "/", "template": "generated-67f7d60c-7f87-4819-be0b-fc4d01a6ad56", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_movie
FROM company_type AS ct,
info_type AS it,
movie_companies AS mc,
movie_info AS mi,
title AS t,
cast_info AS ci,
info_type AS it1,
person_info AS pi
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 1990 AND it1.id = 3 AND lower(pi.info) LIKE '%japan%' AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id AND it.id = mi.info_type_id AND t.id = ci.movie_id AND it1.id = mi.info_type_id AND ci.person_id = pi.person_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mc.movie_id AND it1.id = it.id)
