--{"gen": "erase", "time": "/", "template": "generated-967d0ec2-fdea-4cf4-8242-505baa09f843", "dataset": "full_job", "rows": null}
SELECT min(t.title) AS movie_title
FROM keyword AS k,
movie_companies AS mc,
movie_keyword AS mk,
title AS t,
cast_info AS ci,
role_type AS rt
WHERE (k.keyword = 'character-name-in-title' AND rt.role = 'costume designer' AND mc.movie_id = t.id AND t.id = mk.movie_id AND mk.keyword_id = k.id AND mc.movie_id = mk.movie_id AND ci.movie_id = t.id AND ci.role_id = rt.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id)
