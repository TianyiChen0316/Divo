--{"gen": "combine", "time": "/", "template": "17d", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
company_name AS cn,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
movie_info AS mi,
info_type AS it,
aka_title AS at,
info_type AS it2,
movie_info_idx AS miidx
WHERE (k.keyword = 'character-name-in-title' AND mi.info IN ('Horror', 'Action', 'Sci-Fi', 'Thriller', 'Crime', 'War') AND it.info = 'bottom 10 rank' AND it2.info = 'release dates' AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND mc.company_id = cn.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mi.movie_id AND ci.movie_id = mi.movie_id AND mi.movie_id = mk.movie_id AND t.id = at.movie_id AND mc.movie_id = at.movie_id AND mc.movie_id = mi.movie_id AND at.movie_id = mk.movie_id AND at.movie_id = mi.movie_id AND at.movie_id = ci.movie_id AND it2.id = mi.info_type_id AND miidx.movie_id = t.id AND it.id = miidx.info_type_id AND mi.movie_id = miidx.movie_id AND miidx.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id AND miidx.movie_id = at.movie_id)
