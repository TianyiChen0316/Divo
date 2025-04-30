--{"gen": "erase", "time": "/", "template": "generated-ad4de19b-5832-4402-a2dc-04a2bc5e5202", "dataset": "full_job", "rows": null}
SELECT *
FROM cast_info AS ci,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t
WHERE (k.keyword = 'character-name-in-title' AND ci.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND t.id = mc.movie_id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id)
