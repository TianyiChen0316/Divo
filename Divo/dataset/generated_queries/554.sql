--{"gen": "combine", "time": "/", "template": "e10a", "dataset": "full_job", "rows": null}
SELECT min(n.name),
min(t.title)
FROM info_type AS it1,
info_type AS it2,
movie_info_idx AS mii,
title AS t,
cast_info AS ci,
name AS n,
person_info AS pi,
keyword AS k,
movie_companies AS mc,
movie_keyword AS mk
WHERE (it1.info ILIKE 'rating' AND it2.info ILIKE '%birth%' AND pi.info ILIKE '%india%' AND (mii.info ILIKE '8%' OR mii.info ILIKE '9%' OR mii.info ILIKE '10%') AND k.keyword = 'character-name-in-title' AND it1.id = mii.info_type_id AND t.id = mii.movie_id AND t.id = ci.movie_id AND mii.movie_id = ci.movie_id AND ci.person_id = n.id AND n.id = pi.person_id AND ci.person_id = pi.person_id AND pi.info_type_id = it2.id AND mk.keyword_id = k.id AND ci.movie_id = mc.movie_id AND ci.movie_id = mk.movie_id AND mc.movie_id = mk.movie_id AND t.id = mc.movie_id AND t.id = mk.movie_id AND mc.movie_id = mii.movie_id AND mk.movie_id = mii.movie_id)
