--{"gen": "erase", "time": "/", "template": "generated-cfa8a5f7-ee22-417e-b714-3cea38c02ada", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
complete_cast AS cc,
keyword AS k,
movie_keyword AS mk
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(France)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND t.id = mk.movie_id AND t.id = cc.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND mk.movie_id = cc.movie_id AND mi.movie_id = cc.movie_id AND mc.movie_id = cc.movie_id AND k.id = mk.keyword_id)
