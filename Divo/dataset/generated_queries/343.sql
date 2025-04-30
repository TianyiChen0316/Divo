--{"gen": "erase", "time": "/", "template": "generated-844dc6d8-27eb-4be7-b192-adaf024b60d9", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS japanese_anime_movie
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
title AS t,
movie_info AS mi,
movie_info_idx AS mi_idx,
name AS n1,
movie_keyword AS mk
WHERE (ci.note = '(voice: English version)' AND cn.country_code = '[jp]' AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(co-production)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.production_year > 2000 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND n1.name LIKE '%Tim%' AND n1.name LIKE '%Tim%' AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND mi.movie_id = mi_idx.movie_id AND n1.id = ci.person_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND t.id = mk.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id)
