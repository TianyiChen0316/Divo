--{"gen": "combine", "time": "/", "template": "generated-e456c8ca-56ab-4e6b-b43b-5ab05cfad7db", "dataset": "full_job", "rows": null}
SELECT min(cn.name) AS from_company,
min(t.title) AS non_polish_sequel_movie
FROM company_name AS cn,
movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
cast_info AS ci,
info_type AS it1,
info_type AS it2,
movie_info AS mi,
movie_info_idx AS mi_idx
WHERE (cn.country_code <> '[pl]' AND (cn.name LIKE '%Film%' OR cn.name LIKE '%Warner%') AND mc.note IS NULL AND t.production_year BETWEEN 1950 AND 2000 AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND it1.info = 'genres' AND it2.info = 'release dates' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi_idx.movie_id = mk.movie_id AND it1.id = mi.info_type_id AND it2.id = mi_idx.info_type_id AND t.id = ci.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND ml.movie_id = ci.movie_id AND ml.movie_id = mi.movie_id AND ml.movie_id = mi_idx.movie_id AND mc.movie_id = ci.movie_id AND mc.movie_id = mi.movie_id AND mc.movie_id = mi_idx.movie_id)
