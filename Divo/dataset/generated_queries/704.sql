--{"gen": "erase", "time": "/", "template": "generated-18439a81-0481-4388-b370-93371955a4b6", "dataset": "full_job", "rows": null}
SELECT min(mi.info) AS release_date,
min(t.title) AS modern_american_internet_movie
FROM aka_title AS at,
info_type AS it1,
keyword AS k,
movie_companies AS mc,
movie_info AS mi,
movie_keyword AS mk,
title AS t,
movie_info_idx AS mi_idx
WHERE (it1.info = 'release dates' AND mi.note LIKE '%internet%' AND mi.info IS NOT NULL AND (mi.info LIKE 'USA:% 199%' OR mi.info LIKE 'USA:% 200%') AND t.production_year > 1990 AND mi_idx.info > '5.0' AND t.id = at.movie_id AND t.id = mi.movie_id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = at.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = at.movie_id AND mc.movie_id = at.movie_id AND k.id = mk.keyword_id AND it1.id = mi.info_type_id AND t.id = mi_idx.movie_id AND mc.movie_id = mi_idx.movie_id AND at.movie_id = mi_idx.movie_id AND mk.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id)
