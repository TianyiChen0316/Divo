--{"gen": "combine", "time": "/", "template": "generated-00034fc9-7533-41c7-859f-fc799781731d", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS japanese_anime_movie
FROM cast_info AS ci,
company_name AS cn,
movie_companies AS mc,
title AS t,
keyword AS k,
movie_info AS mi,
movie_info_idx AS mi_idx,
movie_keyword AS mk,
kind_type AS kt
WHERE (ci.note = '(voice: English version)' AND cn.country_code = '[jp]' AND mc.note LIKE '%(Japan)%' AND mc.note LIKE '%(co-production)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.production_year BETWEEN 2006 AND 2007 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND k.keyword IN ('murder', 'violence', 'blood', 'gore', 'death', 'female-nudity', 'hospital') AND mi.info IN ('Horror', 'Thriller') AND ci.movie_id = t.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = mi_idx.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mi_idx.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mi_idx.movie_id AND mi.movie_id = mk.movie_id AND mi.movie_id = mc.movie_id AND mi_idx.movie_id = mk.movie_id AND mi_idx.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND k.id = mk.keyword_id AND t.kind_id = kt.id)
