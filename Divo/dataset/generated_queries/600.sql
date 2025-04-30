--{"gen": "erase", "time": "/", "template": "generated-7161f38f-c362-4d0c-8ec1-4647b0739573", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS internet_movie
FROM aka_title AS at,
company_type AS ct,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t
WHERE (mc.note LIKE '%(200%)%' AND mc.note NOT LIKE '%(TV)%' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:% 200%' AND t.production_year BETWEEN 1950 AND 2000 AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND ct.id = mc.company_type_id)
