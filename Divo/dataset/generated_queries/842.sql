--{"gen": "erase", "time": "/", "template": "generated-02a04934-c8da-403a-a7e0-3f94d8052ad7", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS japanese_anime_movie
FROM cast_info AS ci,
movie_companies AS mc,
title AS t,
movie_info AS mi,
movie_info_idx AS miidx,
movie_keyword AS mk
WHERE (ci.note = '(voice)' AND mc.note LIKE '%(VHS)%' AND mc.note LIKE '%(co-production)%' AND (mc.note LIKE '%(2006)%' OR mc.note LIKE '%(2007)%') AND t.production_year BETWEEN 2005 AND 2015 AND (t.title LIKE 'One Piece%' OR t.title LIKE 'Dragon Ball Z%') AND ci.movie_id = t.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND mi.movie_id = t.id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id AND t.id = mk.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND mi.movie_id = mk.movie_id AND mk.movie_id = mc.movie_id AND miidx.movie_id = ci.movie_id AND miidx.movie_id = mk.movie_id)
