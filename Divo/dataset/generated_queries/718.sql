--{"gen": "erase", "time": "/", "template": "generated-42eb1870-7aa2-4b66-a489-6fd146d5c604", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_title,
min(t.production_year) AS movie_year
FROM movie_companies AS mc,
title AS t,
kind_type AS kt,
movie_info AS mi,
movie_info_idx AS miidx
WHERE (mc.note NOT LIKE '%(as Metro-Goldwyn-Mayer Pictures)%' AND t.production_year > 2008 AND kt.kind = 'movie' AND t.id = mc.movie_id AND mi.movie_id = t.id AND kt.id = t.kind_id AND miidx.movie_id = t.id AND mi.movie_id = miidx.movie_id AND mi.movie_id = mc.movie_id AND miidx.movie_id = mc.movie_id)
