--{"gen": "erase", "time": "/", "template": "generated-77e00081-e09a-4806-a4da-f14822600bf7", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS typical_european_movie
FROM movie_companies AS mc,
movie_info AS mi,
title AS t,
keyword AS k,
kind_type AS kt,
movie_keyword AS mk,
cast_info AS ci
WHERE (mc.note LIKE '%(theatrical)%' AND mc.note LIKE '%(1994)%' AND mi.info IN ('Sweden', 'Norway', 'Germany', 'Denmark', 'Swedish', 'Denish', 'Norwegian', 'German') AND t.production_year > 2005 AND k.keyword IN ('murder', 'murder-in-title', 'blood', 'violence') AND kt.kind IN ('movie', 'episode') AND ci.note IN ('(writer)', '(head writer)', '(written by)', '(story)', '(story editor)') AND t.id = mi.movie_id AND t.id = mc.movie_id AND mc.movie_id = mi.movie_id AND kt.id = t.kind_id AND t.id = mk.movie_id AND mk.movie_id = mi.movie_id AND mk.movie_id = mc.movie_id AND k.id = mk.keyword_id AND t.id = ci.movie_id AND ci.movie_id = mi.movie_id AND ci.movie_id = mk.movie_id AND ci.movie_id = mc.movie_id)
