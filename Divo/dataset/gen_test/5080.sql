--{"gen": "erase", "time": "/", "template": "generated-6cb33fcc-f125-45d7-b88f-48969c19262c", "dataset": "full_job", "rows": null}
SELECT min(mc.note) AS production_note,
min(t.title) AS movie_based_on_book
FROM movie_companies AS mc,
movie_keyword AS mk,
movie_link AS ml,
title AS t,
complete_cast AS cc,
comp_cast_type AS cct1,
movie_info AS mi
WHERE (mc.note IS NOT NULL AND t.production_year > 1950 AND cct1.kind = 'complete+verified' AND mi.note LIKE '%internet%' AND mi.info LIKE 'USA:%200%' AND ml.movie_id = t.id AND t.id = mk.movie_id AND t.id = mc.movie_id AND ml.movie_id = mk.movie_id AND ml.movie_id = mc.movie_id AND mk.movie_id = mc.movie_id AND t.id = mi.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = mc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND cct1.id = cc.status_id AND ml.movie_id = cc.movie_id AND ml.movie_id = mi.movie_id)
