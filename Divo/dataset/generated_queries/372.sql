--{"gen": "erase", "time": "/", "template": "5c", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS american_movie
FROM company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
title AS t
WHERE (ct.kind = 'production companies' AND mc.note NOT LIKE '%(TV)%' AND mc.note LIKE '%(USA)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German', 'USA', 'American') AND t.production_year > 1990 AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND ct.id = mc.company_type_id)
